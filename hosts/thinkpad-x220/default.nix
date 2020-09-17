{ config, lib, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ../../profiles/boot.nix
    ../../profiles/configuration.nix
    ../../profiles/fonts.nix
    ../../profiles/xserver.nix
    ../../profiles/users.nix
  ];
}
