{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./firefox.nix
    ./mpv.nix
    ./termite.nix
    ./sway.nix
  ];
}
