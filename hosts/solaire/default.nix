{
  inputs,
  specialArgs,
  ...
}: let
  nixos = "${inputs.self}/config/nixos";
  hm = "${inputs.self}/config/home-manager";
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

    nixos
    "${nixos}/hardware/uni-sync.nix"

    "${nixos}/programs/games.nix"
    "${nixos}/hardware/nvidia.nix"

    "${nixos}/services/logind.nix"
    "${nixos}/services/greetd.nix"

    "${nixos}/programs/hyprland.nix"
    "${nixos}/services/gnome.nix"

    "${nixos}/services/documentation.nix"

    "${nixos}/services/flatpak.nix"
  ];

  home-manager = {
    users.nezia.imports = [
      hm
      "${hm}/services/udiskie.nix"
      "${hm}/programs/games"

      "${hm}/programs/waybar"
      "${hm}/programs/fuzzel.nix"
      "${hm}/programs/hypr"

      "${hm}/services/swaync"
      "${hm}/programs/swaybg.nix"
      "${hm}/programs/swaylock.nix"

      "${hm}/terminal/emulators/foot.nix"

      "${hm}/services/flatpak.nix"
      "${hm}/services/syncthing.nix"

      "${hm}/programs/editors/neovim.nix"
    ];
    extraSpecialArgs = specialArgs;
  };

  environment.variables.FLAKE = "/home/nezia/.dotfiles";
}
