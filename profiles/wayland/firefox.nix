{ config, lib, pkgs, inputs, ... }: {

  home-manager.users.rafiyq = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
    };
  };
}
