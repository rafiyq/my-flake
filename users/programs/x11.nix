{ config, lib, pkgs, ... }:

{
  home-manager.users.rafiyq = {
    programs = {
      alacritty.enable = true;
      chromium.enable = true;
      firefox.enable = true;
      mpv = {
        enable = true;
        config = {
          save-position-on-quit = true;
          keep-open = true;
        };
      };
    };
  };
}
