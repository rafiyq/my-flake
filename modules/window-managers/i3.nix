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
        keybindings =
          let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in lib.mkOptionDefault {
            "''${modifier}+Tab" = "workspace back_and_forth";
          };
      };
    };
  };
}

