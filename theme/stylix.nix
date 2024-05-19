# Configuration for Stylix
# https://github.com/danth/stylix

# Atlantis Garbage Worker by Grady Frederick
# https://www.artstation.com/artwork/W2GERJ

{ pkgs, ... }:

{
  stylix = {
    image =  ./wallpapers/main.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/classic-dark.yaml";
    polarity = "dark";

    fonts = {
      serif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };
    };
  };
}
