{ config, lib, pkgs, inputs, ... }: {

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      fira-code fira-code-symbols
    ];
    fontconfig.defaultFonts = {
      monospace = [ "Fira Code" ];
      sansSerif = [ "Ubuntu" ];
    };
  };

}
