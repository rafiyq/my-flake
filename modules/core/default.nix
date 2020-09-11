{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./packages.nix
    ./git.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];
}
