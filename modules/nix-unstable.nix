{ config, lib, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;
  nix = {
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "root" "@wheel" ];
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

}
