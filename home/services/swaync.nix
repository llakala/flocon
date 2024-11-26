{lib, ...}: {
  services.swaync = {
    enable = true;
  };
  # systemd.user.services.swaync.Service.Environment = "WAYLAND_DISPLAY=wayland-1";
  systemd.user.services.swaync.Unit.ConditionEnvironment = lib.mkForce "";
}
