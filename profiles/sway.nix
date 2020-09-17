# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock swayidle swaybg
      grim mako clipman slurp
      xwayland qt5.qtwayland
      i3status-rust
      wofi drm_info imv
      light kanshi bemenu
      #wayvnc wf-recorder wl-clipboard wl-gammactl
    ];
  };
}
