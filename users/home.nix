{ config, lib, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rafiyq.home = {
    homeDirectory = "/home/rafiyq";
    packages = with pkgs; [
      #cli
      wget curl
      htop
      p7zip
      #sshfs cifs-utils ms-sys ntfs3g
      gptfdisk parted
      aria2 youtube-dl

      #other
      vanilla-dmz
      #yaru-theme
    ];
  };
}
