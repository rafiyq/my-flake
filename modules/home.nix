{ pkgs, ...}:

{
  import = [
    ./git.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];
}
