{ config, lib, pkgs, ... }: 

{
  home-manager.users.rafiyq.programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
    };
    
    mpv = {
      enable = true;
      config = {
        video-sync = "display-resample";
        hwdec = "vaapi";
        vo = "gpu";
        hwdec-codecs = "all";
        gpu-context = "wayland";
      };
    };
    
    termite = {
      enable = true;
      clickableUrl = true;
      dynamicTitle = true;
      iconName = "terminal";
    };
  };
}
