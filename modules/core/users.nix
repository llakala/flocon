{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.local.systemVars) desktop username;
  inherit (config.local.homeVars) fullName;
in {
  users.users.${username} = {
    isNormalUser = true;
    description = fullName;
    extraGroups = mkIf (desktop != "none") [
      "networkmanager"
      "audio"
      "video"
      "wheel"
      "plugdev"
    ];
  };

  hjem = mkIf (desktop != "none") {
    clobberByDefault = true;
    users.${username} = {
      enable = true;
      directory = "/home/${username}";
      user = "${username}";
      environment = {
        forceOverride = true;
      };
    };
  };
}
