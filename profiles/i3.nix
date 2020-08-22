# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget vim
     firefox
     git
     alacritty
     htop
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable i3 Window Manager
  services.xserver.windowManager.i3.enable = true;

}

