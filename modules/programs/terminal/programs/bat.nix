{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (config.local.systemVars) username;
  toConf = attrs:
    builtins.concatStringsSep "\n"
    (lib.mapAttrsToList (option: value: "--${option}=\"${value}\"") attrs);
in {
  config = lib.mkIf (config.local.systemVars.desktop != "none") {
    hjem.users.${username} = {
      packages = [
        pkgs.bat
        pkgs.bat-extras.batman
      ];
      files = {
        ".config/bat/config".text = toConf {
          theme = "base16";
        };
      };
    };
  };
}
