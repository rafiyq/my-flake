{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./boot.nix
    ./network.nix
    ./console.nix
    ./laptop.nix
    ./sound.nix
    ./bluetooth.nix
    ./nix.nix
    ./fonts.nix
    ./user.nix
  ];
}
