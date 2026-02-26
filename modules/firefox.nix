{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      search = {
        default = "ddg";
      };
      extensions = {
        force = true;

        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          darkreader
          sidebery
          vimium
        ];

        settings = {
          "uBlock0@raymondhill.net".settings = {
            selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-quick-fixes"
            ];
          };
        };
      };
    };
  };
}
