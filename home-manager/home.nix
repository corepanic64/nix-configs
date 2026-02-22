{
  pkgs,
  ...
}:
{
  imports = [
    ../astronvim.nix
  ];

  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;

  home.packages = with pkgs; [ onefetch ];
  home.stateVersion = "25.11";
}
