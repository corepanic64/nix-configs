{ nix-darwin
, nix-homebrew
, home-manager
, ...
}@inputs: nix-darwin.lib.darwinSystem {

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

