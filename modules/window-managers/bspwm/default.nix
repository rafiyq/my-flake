{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./bspwm.nix
    ./sxhkd.nix
  ];
}
