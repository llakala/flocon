{
  inputs,
  specialArgs,
  ...
}: let
  system = "${inputs.self}/system";
  home = "${inputs.self}/home";
in {
  local.systemVars = {
    hostName = "vamos";
    username = "nezia";
  };

  local.homeVars = {
    fullName = "Anthony Rodriguez";
    email = "anthony@nezia.dev";
  };

  imports = [
    ./hardware-configuration.nix
    ./modules

    "${system}"
    "${system}/core/lanzaboote.nix"

    "${system}/hardware/fprintd.nix"
    "${system}/services/power.nix"
    "${system}/services/brightness.nix"

    "${system}/services/logind.nix"
    "${system}/services/greetd.nix"
    "${system}/services/kanata.nix"

    "${system}/programs/hyprland.nix"
    "${system}/services/gnome.nix"
    "${system}/services/mail.nix"

    "${system}/services/documentation.nix"
  ];

  home-manager = {
    users.nezia.imports = [
      "${home}"
      "${home}/services/udiskie.nix"

      "${home}/programs/hypr"
      "${home}/programs/waybar"
      "${home}/programs/fuzzel.nix"

      "${home}/services/swaync"
      "${home}/programs/swaybg.nix"
      "${home}/programs/wlogout.nix"

      "${home}/services/syncthing.nix"

      "${home}/programs/editors/neovim.nix"

      "${home}/terminal/emulators/foot.nix"
    ];
    extraSpecialArgs = specialArgs;
  };

  environment.variables.FLAKE = "/home/nezia/.dotfiles";
}
