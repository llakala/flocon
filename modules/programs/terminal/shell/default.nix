{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.local.systemVars) username;
in {
  imports = [
    ./starship.nix
    ./nushell.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  config = mkIf (config.local.systemVars.desktop != "none") {
    users.users.${username}.shell = pkgs.zsh;
  };
}
