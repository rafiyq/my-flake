{ inputs, config, lib, pkgs, ... }:

{
  imports = [ 
    ./git.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];
}
