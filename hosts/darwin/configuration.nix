{
  self,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ../../packages/system.nix
  ];

  environment.shells = [ pkgs.fish ];

  home-manager.backupFileExtension = "backup";

  programs.fish.enable = true;
  # home-manager.backupFileExtension = "backup";

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    permittedInsecurePackages = [
      "google-chrome-144.0.7559.97"
    ];
  };

  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = [ "/Applications" ];
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
      "cloudflare-warp"
      "freecad"
      "font-hack-nerd-font"
      "keycastr"
    ];
    onActivation.cleanup = "zap";
  };

  system.primaryUser = "tokhir";

  users.users.tokhir = {
    name = "tokhir";
    home = "/Users/tokhir";

    shell = pkgs.fish;
  };

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
}
