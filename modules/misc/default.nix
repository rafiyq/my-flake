{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./base.nix
    ./gtk.nix
    ./xdg.nix
  ];
}
