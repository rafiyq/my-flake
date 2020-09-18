{ config, lib, pkgs, inputs, ... }: {
  
  # UEFI boot
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
    };
    timeout = lib.mkDefault 1;
  };
  boot.tmpOnTmpfs = true;

  # Add ZFS support.
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.requestEncryptionCredentials = true;

  # ZFS services
  services.zfs.autoSnapshot.enable = true;
  services.zfs.autoScrub.enable = true;

}
