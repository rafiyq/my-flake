# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      timeout = lib.mkDefault 2;
    };
    tmpOnTmpfs = true;
  };
  
  
  console.earlySetup = true;
  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "gb";
  time.timeZone = "Asia/Jakarta";
  
  system.stateVersion = "20.03";
}
