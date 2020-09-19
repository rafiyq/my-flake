{ config, lib, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ../../modules/uefi-zfs.nix
    ../../modules/hardware.nix
    ../../modules/nix-unstable.nix
    ../../modules/users.nix
    ../../modules/fonts.nix
    ../../modules/sway.nix
  ];
}
