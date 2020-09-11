# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }: {
  
  home-manager.users.rafiyq = {
    xsession.enable = true;
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        terminal = "alacritty";
        modifier = "Mod4";
        workspaceAutoBackAndForth = true;
        keybindings = lib.mkOptionDefault {
          "${mod}+Tab" = "workspace back_and_forth";
        };
      };
    };
  };
}

