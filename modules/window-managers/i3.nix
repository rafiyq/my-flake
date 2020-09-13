{ config, lib, pkgs, ... }:

{
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

