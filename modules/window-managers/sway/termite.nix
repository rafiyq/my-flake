{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {    
    programs.termite = {
      enable = true;
      clickableUrl = true;
      dynamicTitle = true;
      iconName = "terminal";
    };
  };
}
