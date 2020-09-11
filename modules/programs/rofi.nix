{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.rofi = {
      enable = true;
    };
  };
}
