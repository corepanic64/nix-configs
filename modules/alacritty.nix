{ ... }:
{
  programs.alacritty = {
    enable = true;

    theme = "gruvbox_dark";

    settings = {
      keyboard = {
        bindings = [
          {
            key = "Escape";
            # mode = "Vi";
            action = "ToggleViMode";
          }
        ];
      };

      window = {
        decorations = "buttonless";
        startup_mode = "Maximized";
        padding = {
          x = 5;
          y = 0;
        };
      };

      font = {
        size = 19;

        normal = {
          family = "Hack Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "Hack Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "Hack Nerd Font";
          style = "Italic";
        };
      };
    };
  };
}
