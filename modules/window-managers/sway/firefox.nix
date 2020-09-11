{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
    };
  };
}
