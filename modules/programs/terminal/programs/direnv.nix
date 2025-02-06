{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    programs.direnv.enable = true;
  };
}
