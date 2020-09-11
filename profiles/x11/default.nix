{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./display-manager.nix
    ./input.nix
    ./picom.nix
  ];
}
