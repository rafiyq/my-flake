{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../../../profiles/wayland/sway.nix
    ./firefox.nix
    ./mpv.nix
    ./termite.nix
    ./sway.nix
  ];
}
