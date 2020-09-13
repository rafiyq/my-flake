{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
   #xsession.enable = true;
    xsession.windowManager.bspwm = {
      enable = true;
      settings = {
        "border_width" = 2;
        "split_ratio" = 0.5;
        "gapless_monocle" = true;
      };
      monitors = { "*" = [ "1" "2" "3" "4" "5" "6" ]; };
    };
  };
}
