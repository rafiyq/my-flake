# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  boot.kernelPackages = pkgs.unstable.linuxPackages_latest;
  boot.loader = {
    grub = {
      enable = true;
      version = 2;
      # efiInstallAsRemovable = true;
      device = "/dev/sda";
    };
  };
  
  # boot.extraModprobeConfig = ''
  #   options snd_hda_intel power_save=1
  #   options iwlwifi power_save=1 d0i3_disable=0 uapsd_disable=0
  #   options iwldvm force_cam=0
  # '';

}
