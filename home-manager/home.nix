{
  pkgs,
  ...
}:
{
  imports = [
    ../modules/astronvim.nix
    ../modules/zsh.nix
    ../modules/fish.nix
    ../modules/starship.nix


    ../packages/home.nix
  ];

  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;

  home.packages = with pkgs; [
    onefetch
    fish
    zsh

    # fish plugins

    fishPlugins.done
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc
    grc


    eza
  ];
  home.stateVersion = "25.11";
}
