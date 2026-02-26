{ nix-homebrew, ... }:
{

  homebrew = {
    enable = true;
    casks = [
      "iina" # media player
      "cloudflare-warp"
      "font-hack-nerd-font"
    ];
    onActivation.cleanup = "zap";
  };
}
