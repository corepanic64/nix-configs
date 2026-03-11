{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
    pnpm

    tmux # just in case
    neofetch
    neovim # texting
    alt-tab-macos # i hate macos cmd+tab
    betterdisplay # scale monitor
    lazygit # tui for git operations
    zed-editor # my fav editor rn
    google-chrome # holy chrome

    direnv
    starship
    firefox
  ];
}
