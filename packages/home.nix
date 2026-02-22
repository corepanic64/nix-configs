{
  inputs,
  pkgs,
  ...
}:
let
  system = pkgs.system;
in
{

  home.packages =
    with pkgs;
    [
      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder
      fd

      onefetch # neofetch for git repository
      fastfetch # fast neofetch
      neofetch # neofetch
      btop # replacement of htop/nmon
      zoxide # for faster navigation
      ffmpeg # shame on you if you don't know it
    ];
}
