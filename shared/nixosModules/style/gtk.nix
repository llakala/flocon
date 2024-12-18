{config, ...}: let
  cfg = config.local.style.gtk;
in {
  home-manager.users.${config.local.systemVars.username} = {
    gtk = {
      enable = true;
      iconTheme = {
        inherit (cfg.iconTheme) name package;
      };
      theme = {
        inherit (cfg.theme) name package;
      };
    };
  };
}
