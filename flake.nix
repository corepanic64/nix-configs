{
  description = "Example nix-darwin system flake";

  inputs = {
    # Nix
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Homebrew
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
    };
    homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.tmux # just in case
          pkgs.neofetch
          pkgs.neovim # texting
          pkgs.alt-tab-macos # i hate macos cmd+tab
          pkgs.betterdisplay # scale monitor
          pkgs.lazygit
        ];

       nixpkgs.config.allowUnfree = true;

        system.activationScripts.applications.text = let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = ["/Applications"];
          };
        in
          pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
              '';

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      homebrew = {
        enable = true;
        casks = [
         "iina" # media player
         "google-chrome" # holy chrome
        ];
        onActivation.cleanup = "zap";
      };

      system.primaryUser = "tokhir";
      system.defaults = {
        dock.autohide = true;
        dock.autohide-delay = 0.0;
      };
      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    modules = [
      nix-homebrew.darwinModules.nix-homebrew {
        nix-homebrew = {
          enable = true;

          enableRosetta = true;

          user = "tokhir";

          autoMigrate = true;
        };
      }
    ];
    # $ darwin-rebuild build --flake .#tokhir
    darwinConfigurations."tokhir" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
