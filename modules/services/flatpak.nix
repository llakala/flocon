{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    services.flatpak.enable = true;
  };
}
