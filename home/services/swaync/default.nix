{
  osConfig,
  lib,
  lib',
  ...
}: let
  inherit (lib) optionalString;
  inherit (lib') generateGtkColors;
  inherit (osConfig.theme.scheme) palette;
  inherit (builtins) readFile;
in {
  services.swaync = {
    enable = true;
    style =
      optionalString osConfig.theme.enable generateGtkColors lib palette
      + readFile ./style.css;
  };
  # systemd.user.services.swaync.Service.Environment = "WAYLAND_DISPLAY=wayland-1";
  systemd.user.services.swaync.Unit.ConditionEnvironment = lib.mkForce "";
}
