{ config, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [
      ".idea"
      "node_modules"
      ".DS_Store"
      "*.swp"
    ];

    signing = {
      signByDefault = true;
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      format = "ssh";
    };

    settings = {
      user = {
        name = "corepanic64";
        email = "isakulovtohir902@gmail.com";
      };

      init.defaultBranch = "main";

      core = {
        editor = "micro";
        autocrlf = "input";
      };

      commit.gpgsign = true;
      pull.rebase = true;
      rebase.autoStash = true;
      push.autoSetupRemote = true;
    };
  };
}
