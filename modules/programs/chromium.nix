{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.chromium = {
      enable = true;
    };
  };
}
