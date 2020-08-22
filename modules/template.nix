{ pkgs, ...}:

{
  config = {
    home-manager.users.rafiyq = { pkgs, ..}: {
      programs.tmux = {

      };
    };
  };
}
