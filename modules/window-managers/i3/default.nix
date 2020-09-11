{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./xserver.nix
    ./picom.nix
    ./i3.nix
  ];
}
