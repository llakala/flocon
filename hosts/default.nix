{inputs, ...}: let
  lib' = import ../lib;
  mkSystem = args:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs lib';};
      modules = [../modules] ++ args.modules;
    };
in {
  vamos = mkSystem {
    modules = [
      ./vamos
      inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ];
  };

  solaire = mkSystem {
    modules = [
      ./solaire
    ];
  };

  anastacia = mkSystem {
    modules = [
      ./anastacia
    ];
  };
}
