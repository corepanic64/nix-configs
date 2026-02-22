{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    micro
    curl
    bat
    zellij
    helix
    jujutsu

    rustc
    cargo
    gcc
    pkg-config
    alejandra
    zsh
    fish
    starship
  ];
}
