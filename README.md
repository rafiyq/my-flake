# my-flake
NixOS reproducible environment with flakes

NOTE
install on new hardware
$ nix build github:rafiyqw/my-flake#nixos --experimental-features "nis-command flakes"
$ sudo nixos-install --root /mnt --system ./result

upgrade on existing system
$ nix build github:rafiyqw/my-flake#nixos
$ sudo ./result/bin/switch-to-configuration switch
or
$ nix build github:rafiyqw/my-flake#nixos --experimental-features "nis-command flakes"
$ sudo ./result/bin/switch-to-configuration switch

