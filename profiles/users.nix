# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  users.extraUsers.rafiyq = {
    isNormalUser = true;
    uid = 1000;
    extraGroups =
      [ "users" "wheel" "input" "audio" "networkmanager" "docker" "sway" ];
  };

}
