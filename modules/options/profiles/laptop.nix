{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  options = {
    local.profiles.laptop.enable = mkEnableOption "the laptop profile";
  };

  config.assertions = lib.mkIf config.local.profiles.laptop.enable [
    {
      assertion = !config.local.profiles.server.enable;
      message = "The laptop profile cannot be enabled if `local.profiles.server.enable` is set to true.";
    }
  ];
}
