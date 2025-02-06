{
  lib,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings.main = {
          capslock = "overload(control, esc)";
        };
      };
    };
  };
}
