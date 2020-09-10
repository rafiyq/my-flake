# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {
  
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluezFull;
    powerOnBoot = false;
    config = {
      General = {
        FastConnectable = "true";
        JustWorksRepairing = "always";
        MultiProfile = "multiple";
      };
    };
  };
  
  #hardware.pulseaudio = {
  #  package = pkgs.pulseaudio.override { bluetoothSupport = true; };
  #  extraConfig = ''
  #    load-module module-switch-on-connect
  #    load-module module-bluetooth-discover a2dp_config="ldac_eqmid=hq ldac_fmt=f32"
  #    load-module module-bluetooth-policy
  #  '';
  #  extraModules = with pkgs; [ pulseaudio-modules-bt ];
  #};
}
