{
  self,
  nix-darwin,
  nix-homebrew,
  home-manager,
  ...
}@inputs:
nix-darwin.lib.darwinSystem {
  specialArgs = { inherit self; };

  modules = [
    ./configuration.nix

    nix-darwin.modules.homebrew

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
