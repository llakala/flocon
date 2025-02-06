{
  lib,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    services = {
      # needed for GNOME services outside of GNOME Desktop
      dbus.packages = with pkgs; [
        gnome-settings-daemon
      ];

      gnome.gnome-keyring.enable = true;
    };
  };
}
