{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./boot.nix
    ./network.nix
    ./console.nix
    ./packages.nix
    ./nix.nix
    ./laptop.nix
    ./sound.nix
    ./bluetooth.nix
    ./fonts.nix
    ./users.nix
  ];
}
