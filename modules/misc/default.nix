{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./gtk.nix
    ./xdg.nix
  ];
}
