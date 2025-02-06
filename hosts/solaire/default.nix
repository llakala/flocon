_: {
  imports = [./hardware-configuration.nix ./config/theme.nix];

  local = {
    systemVars = {
      hostName = "solaire";
      username = "nezia";
      desktop = "Hyprland";
    };
    homeVars = {
      fullName = "Anthony Rodriguez";
      email = "anthony@nezia.dev";
      signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEzs7SQH0Vjt9JHoXXmWy9fPU1I3rrRWV5magZFrI5al nezia@solaire";
    };

    profiles = {
      gaming.enable = true;
    };

    modules = {
      nvidia.enable = true;
    };
  };
}
