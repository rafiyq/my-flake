{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.git = {
      enable = true;
      userEmail = "rafiyqw@tutanota.com";
      userName = "Rafiyq Widianto";
    };
  };
}
