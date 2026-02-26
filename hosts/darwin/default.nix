{
  self,
  nix-darwin,
  home-manager,
  nix-homebrew,
  ...
}@inputs:
nix-darwin.lib.darwinSystem {
  specialArgs = { inherit self; };

  modules = [
    ./configuration.nix

    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = "tokhir";
        autoMigrate = true;
      };
    }
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        extraSpecialArgs = { inherit inputs; };
        users = {
          tokhir = import ../../home-manager/home.nix;
        };
      };
    }
  ];
}
