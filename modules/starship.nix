{ ... }:
{
  programs.starship = {
    enable = true;

    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = false;
    };
  };
}
