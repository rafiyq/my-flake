{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./alacritty.nix
    ./chromium.nix
    #./emacs.nix
    #./firefox.nix
    ./rofi.nix
    ./mpv.nix
  ];
}
