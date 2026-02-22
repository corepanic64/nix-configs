{
  pkgs,
  ...
}:
{
  imports = [ ./astronvim.nix ];

  home.packages = with pkgs; [ onefetch ];
  home.stateVersion = "25.11";
}
