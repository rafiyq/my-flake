# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }: {

  services.picom = {
    enable = true;
    # inactiveOpacity = "0.8";
    backend = "glx";
    vSync = true;
    settings = {
      glx-swap-method = 2;
      paint-on-overlay = true;
      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
    };
  };
}

