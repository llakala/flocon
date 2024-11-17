{
  inputs,
  pkgs,
  ...
}: {
  fonts = {
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
    packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-extra
      pkgs.intel-one-mono
      inputs.self.packages.${pkgs.system}.apple-emoji-color
      (pkgs.nerdfonts.override {fonts = ["IntelOneMono"];})
    ];
    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Inter Medium"];
        monospace = ["IntoneMono NF"];
        emoji = ["Apple Color Emoji"];
      };
    };
  };
}
