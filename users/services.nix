{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq.services = {    
    udiskie.enable = true;
  };
}
