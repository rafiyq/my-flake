{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./core/default.nix
    ./misc/default.nix
    ./programs/default.nix
  ];
}
