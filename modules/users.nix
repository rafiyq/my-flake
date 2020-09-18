{ config, lib, pkgs, inputs, ... }: {

  users.users.rafiyq = {
    isNormalUser = true;
    uid = 1000;
    group = "users";
    extraGroups = [
      "wheel"
      "disk"
      "networkmanager"
      "audio"
      "video"
      "input"
      "sway"
      "kvm"
      "render"
    ];
  };

}
