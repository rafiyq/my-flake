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
