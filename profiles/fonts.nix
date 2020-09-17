# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  console.font = lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fontconfig.dpi = 192;
  fonts.fonts = with pkgs;
    [
      # corefonts # Micrsoft free fonts
      # iosevka
      # open-sans # need for telegram app
    ];
  fonts.fontconfig.defaultFonts.monospace = [ "Iosevka" ];
  fonts.enableDefaultFonts = true;

}
