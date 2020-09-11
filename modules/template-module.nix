{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.<pkgs> = {
      enable = true;
    };
  };
}
