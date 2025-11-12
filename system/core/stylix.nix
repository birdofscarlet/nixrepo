{
  pkgs,
  inputs,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-95.yaml";
    image = ../cardinal/walls/1.jpg;
    imageScalingMode = "fit";
    polarity = "dark";

    cursor = {
      name = "Simp1e-Dark";
      package = pkgs.simp1e-cursors;
      size = 12;
    };

    opacity = {
      terminal = 0.7;
    };

    targets = {
      spicetify.enable = false;
    };
    overlays.enable = true;

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
