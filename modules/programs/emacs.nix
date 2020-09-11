{ config, lib, pkgs, ... }: {

  home-manager.users.rafiyq = {
    programs.emacs = {
      enable = true;
      package = pkgs.emacsGit;
    };
  };
}
