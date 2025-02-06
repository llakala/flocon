{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (config.local.systemVars) username;
in {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    hjem.users.${username} = {
      packages = [pkgs.zoxide];
    };
  };
}
