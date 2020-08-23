# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix
    ../modules/home.nix
  ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
    driSupport32Bit = true;
  };

  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {
      enableHybridCodec = true;
    };
  };

  #services.pcscd.enable = true;
  services.udisks2.enable = true;
  
  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      # Fix for some Java AWT applications (e.g. Android Studio),
      # use this if they aren't displayed properly:
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    extraPackages = with pkgs; [
      swaylock swayidle swaybg
      grim mako clipman slurp
      xwayland qt5.qtwayland
      i3status-rust
      termite wofi
      light kanshi 
      #wayvnc wf-recorder wl-clipboard wl-gammactl 
    ];
  };
  
  environment.systemPackages = with pkgs; [
    drm_info imv 
    firefox-wayland
    pulsemixer
    vanilla-dmz
  ];

  fonts.fonts = with pkgs; [
    corefonts
    cascadia-code
    fira-code fira-code-symbols
    iosevka
    noto-fonts noto-fonts-cjk noto-fonts-emoji
    source-code-pro
  ];

  home-manager.users.rafiyq = { pkgs, ...}: {
    wayland.windowManager.sway = {
      enable = true;
      xwayland = true;
      extraConfig = ''
        seat seat0 xcursor_theme "Vanilla-DMZ"
      '';
    };

    home.sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "termite";
      
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_USE_XINPUT2 = "1";

      WLR_DRM_NO_MODIFIERS = "1";
      
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "sway";
    };

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

