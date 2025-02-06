{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  options = {
    local.profiles.server.enable = mkEnableOption "the server profile";
  };

  config.assertions = lib.mkIf config.local.profiles.server.enable [
    {
      assertion = !(config.local.systemVars.desktop != "none");
      message = "The server profile cannot be enabled if `local.profiles.desktop.enable` is set to true.";
    }

    {
      assertion = !config.local.profiles.gaming.enable;
      message = "The server profile cannot be enabled if `local.profiles.gaming.enable` is set to true.";
    }
  ];
}
