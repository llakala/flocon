{...}: {
  users.users.nezia = {
    isNormalUser = true;
    description = "Anthony Rodriguez";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
