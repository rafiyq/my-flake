{ config, lib, pkgs, inputs ... }: {

  # Networking
  networking.networkmanager.enable = true;

  # Console
  console.earlySetup = true;

  # Power management
  services.tlp.enable = true;
  services.tlp.extraConfig = ''
    CPU_SCALING_GOVERNOR_ON_AC=performance
    CPU_SCALING_GOVERNOR_ON_BAT=powersave
    CPU_HWP_ON_AC=performance
  '';
  services.logind.lidSwitch = "suspend";
  
  # Fn keys
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      {
        keys = [ 225 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/light -A 5";
      }
      {
        keys = [ 224 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/light -U 5";
      }
    ];
  };

  # Audio
  hardware.pulseaudio = {
    enable = true;
    tcp.enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  # Bluetooth
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

}
