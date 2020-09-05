# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig.dpi = 192;
    fontconfig.defaultFonts.monospace = [ "Iosevka" ];
    enableDefaultFonts = true;
    fonts = with pkgs; [ ];
  };
}
