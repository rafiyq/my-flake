# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  # boot
  boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  
  # flake support
  nixpkgs.config.allowUnfree = true;
  nix = {
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "root" "@wheel" ];
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  
  # to enable brightness keys 'keys' value may need updating per device
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
  
  # power management features
  services.tlp.enable = true;
  services.tlp.extraConfig = ''
    CPU_SCALING_GOVERNOR_ON_AC=performance
    CPU_SCALING_GOVERNOR_ON_BAT=powersave
    CPU_HWP_ON_AC=performance
  '';
  services.logind.lidSwitch = "suspend";
  
  hardware.bluetooth.enable = true;

  hardware = {
    bluetooth.enable = true;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "gb";
  time.timeZone = "Asia/Jakarta";
  
  networking = {
    hostName = "thinkpad-x220";
    networkmanager.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  
  hardware.pulseaudio = {
    enable = true;
    tcp.enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig.dpi = 192;
    fontconfig.defaultFonts.monospace = [ "Iosevka" ];
    enableDefaultFonts = true;
    fonts = with pkgs; [ ];
  };

  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [ ];
  users.extraUsers.rafiyq = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ 
      "users" "wheel" "networkmanager" "kvm" "libvirtd"
      "docker" "transmission" "audio" "video" "sway"
      "sound" "pulse" "input" "render" "dialout"
    ];
  };
  
  #services.mingetty.autologinUser = "rafiyq";
  #environment.loginShellInit = ''
  #  [[ "$(tty)" == /dev/tty? ]] && sudo /run/current-system/sw/bin/lock this
  #  [[ "$(tty)" == /dev/tty1 ]] && sway
  #'';

  system.stateVersion = "20.03";
}
