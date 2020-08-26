# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }: {

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c171b746-473a-4093-8e13-8f70e6f1ffc4";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/376fd50c-fec3-499a-97e7-a28e992134bc"; }
    ];

  boot = { 
    initrd.availableKernelModules = 
      [ "ehci_pci" "ahci" "xhci_pci" "usb_storage" "sd_mod" "sdhci_pci" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };
  };

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
   experimental-features = nix-command flakes
  '';

  hardware = {
    bluetooth.enable = true;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  i18n.defaultLocale = "en_GB.UTF-8";
  console.font = "Lat2-Terminus16";
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
    fonts = with pkgs; [ ];
  };

  users.defaultUserShell = pkgs.zsh;

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [ ];
  };

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
 
  system.stateVersion = "20.03";
}
