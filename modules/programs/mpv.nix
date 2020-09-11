{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.mpv = {
      enable = true;
      config = {
        save-position-on-quit = true;
        keep-open = true;
      };
    };
  };
}
