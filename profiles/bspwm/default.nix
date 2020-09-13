# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }: {
  
  imports = [ 
    ../x11/default.nix
  ];

  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "none+bspwm";
      lightdm.enable = true;
      lightdm.autoLogin = {
        enable = true;
        user = "rafiyq";
      };
      job.logToJournal = true;
    };
    windowManager.bspwm = {
      enable = true;
      configFile = "../../config/bspwm/bspwmrc";
      sxhkd.configFile = "../../config/bspwm/sxhkdrc";
    };
  };
}

