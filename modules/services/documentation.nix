{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    documentation = {
      enable = true;

      man = {
        enable = true;
        man-db.enable = false;
        mandoc.enable = true;
        generateCaches = true;
      };
    };
  };
}
