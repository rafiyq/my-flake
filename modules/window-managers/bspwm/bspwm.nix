{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    xsession.enable = true;
    xsession.windowManager.bspwm = {
      enable = true;
      setting = {};
    };
  };
}
