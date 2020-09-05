{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./boot.nix
    ./console.nix
    ./network.nix
    ./laptop.nix
    ./sound.nix
    ./bluetooth.nix
    ./nix.nix
    ./fonts.nix
    ./user.nix
  ];
}
