{ config, lib, pkgs, ... }:

{
  imports = [
    ./thinkpad-x220.nix
    ../../profiles/boot.nix
    ../../profiles/configuration.nix
    ../../profiles/fonts.nix
    ../../profiles/xserver.nix
    ../../profiles/users.nix
  ];
}
