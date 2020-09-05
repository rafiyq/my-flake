# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  users = {
    defaultUserShell = pkgs.zsh;
    extraUsers.rafiyq = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ 
        "users" "wheel" "networkmanager" "kvm" "libvirtd"
        "docker" "transmission" "audio" "video" "sway"
        "sound" "pulse" "input" "render" "dialout"
      ];
    };
  };
}
