{ config, pkgs, ... }:

{

    gtk = {
      enable = true;
      font = { name = "Noto Sans 11"; package = pkgs.noto-fonts; };
      iconTheme = { name = "Numix"; package = pkgs.numix-icon-theme; };
      # cursorTheme = { name = "Vanilla-DMZ"; package = pkgs.vanilla-dmz; };
      theme = { name = "Arch-Dark"; package = pkgs.arc-theme; };
      gtk3.extraConfig = {
        # gtk-cursor-theme-size = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
      };
    };
  }; 
}

