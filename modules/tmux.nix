{ pkgs, ...}:

{
  config = {
    home-manager.users.rafiyq = { pkgs, ..}: {
      programs.tmux = {
        enable = true;
        
        historyLimit = 500;
        keyMode = "emacs";
        terminal = "screen-256color";
        extraConfig = ''
          set -g mouse on
          
          set -g status-bg colour234
          set -g status-fg colour205
          set -g status-left ' #[fg=colour250]#S '
 
          setw -g windows-status-current-format ' #I#[fg=colour250]:[fg=colour255]#W#[fg=colour50]#F '
          setw -g windows-status-format ' #I#[fg=colour236:#[fg=colour250]#W#[fg=colour244]#F '

          set -g status-right '#[fg=colour233,bg=clour241,bold] %a %d %b #[fg=colour233,bg=colour245,bold] %I:%M:%P '

          set -g pane-active-border-style fg=colour205
        '';
      };
    };
  };
}
