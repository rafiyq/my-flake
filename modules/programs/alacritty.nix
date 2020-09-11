{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.alacritty = {
      enable = true;
    };
  };
}
