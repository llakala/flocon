{
  lib,
  options,
  ...
}: let
  inherit (lib) mkOption;
  inherit (lib.types) enum str;
in {
  options.local.systemVars = {
    hostName = mkOption {
      type = str;
      description = ''
        hostname for the current host
      '';
      default = null;
    };
    username = mkOption {
      type = str;
      description = ''
        username for the home directory
      '';
      default = "user";
    };
    desktop = mkOption {
      type = enum ["none" "Hyprland" "cosmic"];
      default = "none";
      description = ''
        the desktop environment to be used
      '';
    };
  };

  config.assertions = [
    {
      assertion = options.local.systemVars.hostName.isDefined;
    }
    {
      assertion = options.local.systemVars.username.isDefined;
    }
    {
      assertion = options.local.systemVars.desktop.isDefined;
    }
  ];
}
