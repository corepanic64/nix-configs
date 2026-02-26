{ ... }:
{

  homebrew = {
    enable = true;
    casks = [
      "iina" # media player
      "cloudflare-warp"
      "font-hack-nerd-font"
      "keycastr"
    ];
    onActivation.cleanup = "zap";
  };
}
