{ config, lib, pkgs, inputs, ... }: {

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [ ];
  };
  services.xserver.displayManager.sessionPackages = [ pkgs.sway ];

  home-manager.users.rafiyq = {     
    wayland.windowManager.sway = {
      enable = true;
      systemdIntegration = true;
      xwayland = true;
      wrapperFeatures.gtk = true;
      extraSessionCommands = ''
        export MOZ_ENABLE_WAYLAND=1;
        export MOZ_USE_XINPUT2=1;
        
        export WLR_DRM_NO_MODIFIERS=1;
        export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0 sway;
        export SDL_VIDEODRIVER=wayland;
        
        export QT_QPA_PLATFORM=wayland;
        export QT_WAYLAND_DISABLE_WINDOWDECORATION=1;
        export QT_WAYLAND_FORCE_DPI=physical;
        
        export _JAVA_AWT_WM_NONREPARENTING=1;
        export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.xrender=true";
        
        export XDG_SESSION_TYPE=wayland;
        export XDG_CURRENT_DESKTOP=sway;
      '';
      config = {
        #fonts = [ "Iosevka 8" ];
        modifier = "Mod4";
        menu = "${pkgs.wofi}/bin/wofi --insensitive --show drun";
        terminal = "${pkgs.termite}/bin/termite";
        window.titlebar = true;
        window.border = 4;
        input = {
          "2:7:SynPS/2_Synaptics_TouchPad" = {
            click_method = "clickfinger";
            tap = "enabled";
            dwt = "enabled";
            scroll_method = "two_finger";
            natural_scroll = "enabled";
            #accel_profile = "adaptive";
            pointer_accel = "1";
          };
          "1:1:AT_Translated_Set_2_keyboard" = { xkb_layout = "gb"; };
        };
        output = { "*" = { bg = "#185373 solid_color"; }; };
        #keybindings = lib.mkOptionDefault {
        #  "${config.modifier}+Print" = "exec ${pkgs.grim}/bin/grim Pictures/$(date +'Screenshot-%d%m%Y-%H%M%S').png";
        #  "${config.modifier}+Shift+Print" = ''
        #    exec ${pkgs.grim}/bin/grim -g | \
        #    ${pkgs.slurp}/bin/slurp Pictures/$(date +'Screenshot-%d%m%Y-%H%M%S').png'';
        #};
      }; 
      extraConfig = ''
        seat seat0 xcursor_theme "Yaru"
      '';
    };
  };
}
