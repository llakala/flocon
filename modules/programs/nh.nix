{
  lib,
  config,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.local.systemVars) desktop username;
in {
  config = mkIf (desktop != "none") {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 30d --keep 3";
      };
    };

    hjem.users.${username}.environment.sessionVariables.FLAKE = "${config.hjem.users.${username}.directory}/.dotfiles";
  };
}
