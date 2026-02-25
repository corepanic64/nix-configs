{ ... }:
{
  programs.zed-editor.userKeymaps = [
    {
      context = "VimControl && !menu";
      bindings = {
        cmd-j = "editor::MoveLineDown";
        cmd-k = "editor::MoveLineUp";
        shift-k = "editor::Hover";
        "space o" = "tab_switcher::Toggle";
        "space e" = "workspace::ToggleRightDock";
        "space p" = "outline::Toggle";
        "space v" = "editor::GoToDefinitionSplit";
        "space b" = "editor::GoToDefinition";
        "space s" = "pane::DeploySearch";
        "g r" = "editor::FindAllReferences";
        shift-n = "editor::ToggleFold";
        "space f" = "file_finder::Toggle";
        ctrl-l = "pane::ActivateNextItem";
        ctrl-h = "pane::ActivatePreviousItem";
      };
    }
    {
      context = "ProjectPanel && not_editing";
      bindings = {
        a = "project_panel::NewFile";
        f = "project_panel::NewDirectory";
        c = "project_panel::Copy";
        r = "project_panel::Rename";
        d = "project_panel::Delete";
        x = "project_panel::Cut";
        p = "project_panel::Paste";
        D = [
          "project_panel::Delete"
          {
            skip_prompt = true;
          }
        ];
      };
    }
    {
      context = "Workspace";
      bindings = {
        "alt-w h" = "workspace::ActivatePaneLeft";
        "alt-w j" = "workspace::ActivatePaneDown";
        "alt-w k" = "workspace::ActivatePaneUp";
        "alt-w l" = "workspace::ActivatePaneRight";
        "alt-w H" = "workspace::SwapPaneLeft";
        "alt-w L" = "workspace::SwapPaneRight";
        alt-i = "workspace::ToggleLeftDock";
        alt-t = "workspace::NewTerminal";
        cmd-t = "workspace::NewCenterTerminal";
      };
    }
    {
      context = "Editor && vim_mode == visual && !VimWaiting && !VimObject";
      bindings = {
        p = [
          "vim::Paste"
          {
            preserve_clipboard = true;
          }
        ];
      };
    }
    {
      context = "((FileFinder || FileFinder > Picker > Editor) || FileFinder > Picker > menu)";
      bindings = {
        cmd-shift-p = "command_palette::Toggle";
      };
    }
  ];
}
