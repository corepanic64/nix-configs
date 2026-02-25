{ pkgs
, ...
}: pkgs.mkShell {
  packages = with pkgs; [
    nixd
    statix
    deadnix
    nixfmt-tree

    self.formatter.${system}
  ];
}
