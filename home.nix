{ config, lib, pkgs, ... }: {

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rafiyq = {
    home.packages = with pkgs; [
      #cli
      wget curl htop
      unrar unzip zip
      sshfs cifs-utils ms-sys ntfs3g
      gptfdisk parted
      aria2 youtube-dl
      pulsemixer

      #fonts
      corefonts
      cascadia-code source-code-pro iosevka
      fira-code fira-code-symbols
      noto-fonts noto-fonts-cjk noto-fonts-emoji

      #sway
      swaylock swayidle swaybg
      grim mako clipman slurp
      xwayland qt5.qtwayland
      i3status-rust
      wofi drm_info imv
      light kanshi
      #wayvnc wf-recorder wl-clipboard wl-gammactl

      #other
      yaru-theme
    ];
 
    home.sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "vim";
      TERMINAL = "termite";
    };

    home.keyboard.layout = "gb";
    home.homeDirectory = "/home/rafiyq";
    
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
    };
    
    programs.termite = {
      enable = true;
      font = "Cascadia Code 10";
    };

    wayland.windowManager.sway = {
      enable = true;
      systemdIntegration = true;
      xwayland = true;
      wrapperFeatures = {
        base = true;
        gtk = true;
      };
      extraSessionCommands = ''
      #  export MOZ_ENABLE_WAYLAND = "1";
      #  export MOZ_USE_XINPUT2 = "1";
      #  
      #  export WLR_DRM_NO_MODIFIERS = "1";
        export SDL_VIDEODRIVER = "wayland";
        export QT_QPA_PLATFORM = "wayland";
        export QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        export _JAVA_AWT_WM_NONREPARENTING = "1";
        
      #  export XDG_SESSION_TYPE = "wayland";
      #  export XDG_CURRENT_DESKTOP = "sway";
      '';
      config = {
        fonts = [ "Iosevka 9" ];
        modifier = "Mod4";
        menu = "${pkgs.wofi}/bin/wofi --insensitive --show drun";
        terminal = "${pkgs.termite}/bin/termite";
         
      }; 
      #extraConfig = ''
      #  seat seat0 xcursor_theme "Suru"
      #'';
    };

    programs.git = {
      enable = true;
      userEmail = "rafiyqw@tutanota.com";
      userName = "Rafiyq Widianto";
    };

    programs.tmux = {
      enable = true;

      historyLimit = 500;
      keyMode = "emacs";
      terminal = "screen-256color";
      extraConfig = ''
        set -g mouse on

        set -g status-bg colour234
        set -g status-fg colour205
        set -g status-left ' #[fg=colour250]#S '

        setw -g windows-status-current-format ' #I#[fg=colour250]:[fg=colour255]#W#[fg=colour50]#F '
        setw -g windows-status-format ' #I#[fg=colour236:#[fg=colour250]#W#[fg=colour244]#F '

        set -g status-right '#[fg=colour233,bg=clour241,bold] %a %d %b #[fg=colour233,bg=colour245,bold] %I:%M:%P '

        set -g pane-active-border-style fg=colour205
      '';
    };

    programs.vim = {
      enable = true;
      settings = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
      extraConfig = ''
        syntax on
        set hlsearch
        set number
      '';
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      defaultKeymap= "emacs";
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableCompletion = true;
      history = {
        size = 500;
        save = 1000;
        path = ".config/zsh/zsh_history";
      };

      localVariables = {
        PROMPT = "%B%F{171}%n%F{135}@%F{99}%M%b %F{81}%~ %f%# ";
        # RPROMPT = \$vcs_info_msg_0_ ;
      };

      shellAliases = {
        ls = "ls --color=auto";
        ll = "ls -AlFH";
        grep = "grep --color=auto";
        fgrep = "fgrep --color=auto";
        egrep = "egrep --color=auto";
      };
    };
  };
}
