# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  nixpkgs.config = { allowUnfree = true; };

  services.actkbd = {
    enable = true;
    bindings = [
      {
        keys = [ 224 ];
        events = [ "key" "rep" ];
        command = "${pkgs.light}/bin/light -U 4";
      }
      {
        keys = [ 225 ];
        events = [ "key" "rep" ];
        command = "${pkgs.light}/bin/light -A 4";
      }
      {
        keys = [ 113 ];
        events = [ "key" ];
        command =
          "/run/current-system/sw/bin/runuser -l abcdw -c '${pkgs.alsaUtils}/bin/amixer -q set Master toggle'";
      }
      {
        keys = [ 114 ];
        events = [ "key" "rep" ];
        command =
          "/run/current-system/sw/bin/runuser -l abcdw -c '${pkgs.alsaUtils}/bin/amixer -q -c 0 set Master 4- unmute'";
      }
      {
        keys = [ 115 ];
        events = [ "key" "rep" ];
        command =
          "/run/current-system/sw/bin/runuser -l abcdw -c '${pkgs.alsaUtils}/bin/amixer -q -c 0 set Master 4+ unmute'";
      }
    ];
  };

  environment.pathsToLink = [
    "/share/zsh" # Required for zsh autocomplete for systemctl
  ];

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  
  # Console
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  time.timeZone = "Asia/Jakarta";

  hardware.pulseaudio = {
    enable = true;
    tcp.enable = true; # need for mpd
    support32Bit = true; # need for steam
    package = pkgs.pulseaudioFull;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };

  systemd.services.thinkpad-fix-sound = {
    description = "Fix the sound on X1 Yoga";
    path = [ pkgs.alsaTools ];
    wantedBy = [ "default.target" ];
    after = [ "sound.target" "alsa-store.service" ];
    script = ''
      ${pkgs.alsaTools}/bin/hda-verb /dev/snd/hwC0D0 0x1d SET_PIN_WIDGET_CONTROL 0x0
    '';
  };

  environment.systemPackages = with pkgs;
    [
      # emacs
      # vim
      # git
    ];
  
  users.defaultUserShell = pkgs.zsh;

  programs = { light.enable = true; };

  system.stateVersion = "20.03"; # Did you read the comment?
}
