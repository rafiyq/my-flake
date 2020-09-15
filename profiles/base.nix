{ config, lib, pkgs, ... }:

{
  # Boot
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
      };
      timeout = lib.mkDefault 1;
    };
    tmpOnTmpfs = true;
  };

  # Grub
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  #boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  
  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    useDHCP = false;
    interfaces = {
      enp0s25.useDHCP = true;
      wlp3s0.useDHCP = true;
    };
  };

  # Console
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  time.timeZone = "Asia/Jakarta";

  # Power management
  services.tlp.enable = true;
  services.tlp.extraConfig = ''
    CPU_SCALING_GOVERNOR_ON_AC=performance
    CPU_SCALING_GOVERNOR_ON_BAT=powersave
    CPU_HWP_ON_AC=performance
  '';
  services.logind.lidSwitch = "suspend";
  
  # Fn keys
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

  # Fonts
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      dejavu_fonts
      fira-code fira-code-symbols
      noto-fonts noto-fonts-cjk
      font-awesome-ttf
    ];
    fontconfig.defaultFonts = {
      monospace = [ "Fira Code" ];
      sansSerif = [ "Ubuntu" ];
    };
  };

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix = {
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "root" "@wheel" ];
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Users
  users.users = {
    rafiyq = {
      isNormalUser = true;
      uid = 1000;
      shell = "/run/current-system/sw/bin/zsh";
      group = "users";
      extraGroups = [
        "wheel" "disk" "audio" "video" "input" "kvm" "render"
      ];
    };
  };

  # System Packages
  programs = {
    light.enable = true;
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [];

  system.stateVersion = "20.03"; # Did you read the comment?
}
