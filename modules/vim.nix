{ pkgs, ...}:

{
  config = {
    home-manager.users.rafiyq = { pkgs, ..}: {
      programs.vim = {
        enable = true;
        setting = {
          expandtab = true;
          number = true;
          shiftwidth = 2;
          tabstop = 2;
        };
        extraConfig = ''
          syntax on
          set hlsearch
        '';
      };
    };
  };
}
