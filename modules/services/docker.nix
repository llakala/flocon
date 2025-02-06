{
  lib,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [pkgs.distrobox];
  };
}
