{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {    
    gtk = {
      enable = true;
      font = {
        name = "Noto Sans 11";
        package = pkgs.noto-fonts;
      };
      iconTheme = {
        name = "Yaru";
        package = pkgs.yaru-theme;
      };
      theme = {
        name = "Yaru";
        package = pkgs.yaru-theme;
      };
      #gtk2.extraConfig = { };
      gtk3.extraConfig = {
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };

    xdg = {
      enable = true;
      userDirs.enable = true; 
      mimeApps.enable = true;
    };
  };
}
