{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {    
    xdg = {
      enable = true;
      userDirs.enable = true; 
    };
  };
}
