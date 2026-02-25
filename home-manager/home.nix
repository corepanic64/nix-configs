{ ... }:
{
  imports = [
    ../packages/home.nix

    ../modules/additions.nix
    ../modules/astronvim.nix
    ../modules/zsh.nix
    ../modules/fish.nix
    ../modules/starship.nix
  ];

  home.stateVersion = "25.11";
}
