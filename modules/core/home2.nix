{ pkgs, ...}:

{
  imports = [
    ./git.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];
}
