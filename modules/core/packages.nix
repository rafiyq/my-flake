{ config, lib, pkgs, ... }: {

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rafiyq = {
    home.stateVersion = "20.09";
    home.keyboard.layout = "gb";
    home.homeDirectory = "/home/rafiyq";
    home.packages = with pkgs; [
      #cli
      wget curl htop
      unrar unzip zip
      sshfs cifs-utils ms-sys ntfs3g
      gptfdisk parted
      aria2 youtube-dl

      #other
      vanilla-dmz
      #yaru-theme
    ];
    systemd.user.startServices = true;
  };
}
