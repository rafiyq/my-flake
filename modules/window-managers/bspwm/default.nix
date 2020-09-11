{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../../../profiles/x11/default.nix
    ../../misc/default.nix
    ../../programs/default.nix
    ./bspwm.nix
    ./sxhkd.nix
  ];
}
