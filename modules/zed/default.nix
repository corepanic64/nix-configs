{ ... }:
{
  programs.zed-editor = {
    enable = true;

    userKeymaps = import ./keymaps.nix { };

    userSettings = import ./settings.nix { };

    extensions = [
      "wakatime"
      "zig"
      "material-icon-theme"
      "toml"
      "nix"
      "make"
      "env"
    ];
  };
}
