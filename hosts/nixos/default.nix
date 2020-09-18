{ config, lib, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ../../modules/fonts.nix
    ../../modules/hardware.nix
    ../../modules/nix-unstable.nix
    ../../modules/users.nix
    ../../modules/xserver.nix
  ];
}
