{ config, lib, pkgs, inputs, ... }: {

  home-manager.users.rafiyq = {    
    programs.termite = {
      enable = true;
      clickableUrl = true;
      dynamicTitle = true;
      font = "Iosevka 12";
      iconName = "terminal";
    };
  };
}
