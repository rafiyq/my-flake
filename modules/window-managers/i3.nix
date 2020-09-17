{ config, lib, pkgs, ... }:

{
  home-manager.users.rafiyq = {
    xsession.enable = true;
    xsession.windowManager.i3 = rec {
      enable = true;
      # Also disables titlebars https://rycee.gitlab.io/home-manager/options.html#opt-xsession.windowManager.i3.config.window.titlebar
      package = pkgs.i3-gaps;
      config = {
        terminal = "alacritty";
        modifier = "Mod4";
        menu = "rofi -show run";
        # gaps.smartBorders = "on";
        workspaceAutoBackAndForth = true;
        # TODO: revisit and cleanup hotkeys
        # https://github.com/rycee/home-manager/blob/master/modules/services/window-managers/i3-sway/i3.nix#L22
        keybindings = let mod = config.modifier;
        in lib.mkOptionDefault {
          "${mod}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show run";

          "${mod}+d" = null;
          "${mod}+w" = null;
          "${mod}+f" = null;
          "${mod}+Return" = null;

          "${mod}+t" = "workspace number 1";
          "${mod}+Tab" = "workspace back_and_forth";

          "${mod}+Shift+f" = "fullscreen toggle";
          "${mod}+Shift+l" = "exec ${pkgs.i3lock}/bin/i3lock -c 222222";
          "${mod}+Shift+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
          "${mod}+Shift+c" = "kill";
          "Shift+Print" =
            "exec ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";

          "${mod}+Print" = ''
            exec ${pkgs.maim}/bin/maim | \
            ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png'';
          "Ctrl+${mod}+Print" = ''
            exec mkdir -p ${xdg.userDirs.pictures}/shots && \
            ${pkgs.maim}/bin/maim ${xdg.userDirs.pictures}/shots/$(date +%FT%R:%S).png'';
        };
        bars = [{
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
            colors = {
              background = "#000000";
              statusline = "#ffffff";
              separator = "#666666";
            };
        }];
      };
    };
    services.random-background = {
      enable = true;
      imageDirectory = "${xdg.userDirs.pictures}/wallpapers";
    };
    services.network-manager-applet.enable = true;
  };
}

