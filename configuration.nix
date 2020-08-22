# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  nix.trustedUsers = [ "rafiyq" ];
  users.extraUsers."rafiyq" = {
    isNormalUsers = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "kvm" "libvirtd" "docker" "transmission" "audio" "video" "sway" "sound" "pulse" "input" "render" "dialout" ];
  };
  
  inputs.home.nixosModules."home-manager"

  home-manager.useGlobalPkgs = true;
  home-manager.users.rafiyq = { pkgs, ...}: {
    home.sessionVariables = {
      EDITOR = "vim";
    };
    programs = {
      direnv.enable = true;
      git.package = pkgs.gitAndTools.gitFull;
      gpg.enable = true;
      home-manager.enable = true;
      htop.enable = true;
    };
    home.packages = with pkgs; [
      wget curl
      htop which
      unrar unzip zip
      sshfs cifs-utils ms-sys ntfs3g
      gptfdisk parted
      aria2 youtube-dl
      brightnessctl pulsemixer
      termite alacritty
      chromium firefox
    ];
   }; 

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

