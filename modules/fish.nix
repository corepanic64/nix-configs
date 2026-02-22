{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting
    '';

    # shellInitLast = ''
    #   awzod random
    #   echo \n
    # '';

    shellAliases = {
      zj = "zellij";
      ls = "exa";
      nv = "nvim";
      mf = "microfetch";

      die = "shutdown now";
      re = "reboot";

      reload = "sudo darwin-rebuild switch --flake ~/nix#tokhir";

      # NixOS related
      past = "nix profile history --profile /nix/var/nix/profiles/system";
      garbage = "sudo nix-collect-garbage --delete-old";
    };

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
  };
}
