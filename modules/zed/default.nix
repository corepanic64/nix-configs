{ ... }:
{
  imports = [
    ./keymaps.nix
    ./settings.nix
  ];

  programs.zed-editor = {
    enable = true;

    extensions = [
      "wakatime"
      "zig"
    ];
  };
}
