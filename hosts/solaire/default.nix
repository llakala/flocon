{
  inputs,
  specialArgs,
  ...
}: let
  system = "${inputs.self}/system";
  home = "${inputs.self}/home";
in {
  local.systemVars = {
    hostName = "solaire";
    username = "nezia";
  };

  local.homeVars = {
    fullName = "Anthony Rodriguez";
    email = "anthony@nezia.dev";
  };
  imports = [
    ./hardware-configuration.nix
    ./modules

    system
    "${system}/hardware/uni-sync.nix"

    "${system}/programs/games.nix"
    "${system}/hardware/nvidia.nix"

    "${system}/services/logind.nix"
    "${system}/services/greetd.nix"

    "${system}/programs/hyprland.nix"
    "${system}/services/gnome.nix"

    "${system}/services/documentation.nix"

    "${system}/services/flatpak.nix"
  ];

  home-manager = {
    users.nezia.imports = [
      home
      "${home}/services/udiskie.nix"
      "${home}/programs/games"

      "${home}/programs/waybar"
      "${home}/programs/fuzzel.nix"
      "${home}/programs/hypr"

      "${home}/services/swaync"
      "${home}/programs/swaybg.nix"
      "${home}/programs/swaylock.nix"

      "${home}/terminal/emulators/foot.nix"

      "${home}/services/flatpak.nix"
      "${home}/services/syncthing.nix"

      "${home}/programs/editors/neovim.nix"
    ];
    extraSpecialArgs = specialArgs;
  };

  environment.variables.FLAKE = "/home/nezia/.dotfiles";
}
