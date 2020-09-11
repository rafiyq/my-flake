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
      light kanshi bemenu
      #wayvnc wf-recorder wl-clipboard wl-gammactl

      #other
      vanilla-dmz
      #yaru-theme
    ];
 
    home.sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "vim";
      TERMINAL = "termite";
    };

    home.keyboard.layout = "gb";
    home.homeDirectory = "/home/rafiyq";
    
  };
}
