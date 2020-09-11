# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }: {
  
  services.xserver = {
    enable = true;

    displayManager.lightdm.enable = true;
    displayManager.lightdm.autoLogin = {
      enable = true;
      user = "rafiyq";
    };
    
    displayManager.session = [{
      manage = "desktop";
      name = "xsession";
      start = "exec $HOME/.xsession";
    }];
    displayManager.defaultSession = "xsession";
    # https://vid.bina.me/tools/nixos/breaking-down-the-nixos-gui-setup/
    displayManager.job.logToJournal = true;
  };
}

