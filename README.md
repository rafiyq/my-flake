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

Partition
sgdisk --zap-all /dev/sda
Make UEFI partition
SDA_ID=ata-ST320LT020-9YG142_W0Q408S8
SDA_ID=ata-ST320LT020-9YG142_W0Q408S8
sgdisk -n 0:0:+512MiB -t 0:EF00 -c 0:boot /dev/disk/by-id/ata-ST320LT020-9YG142_W0Q408S8
sgdisk -n 0:0:+12GiB -t 0:8200 -c 0:swap /dev/disk/by-id/ata-ST320LT020-9YG142_W0Q408S8
sgdisk -n 0:0:0 -t 0:BF01 -c 0:ZFS /dev/disk/by-id/ata-ST320LT020-9YG142_W0Q408S8
zpool create -f -o ashift=12 -O mountpoint=none -O encryption=on -O keyformat=passphrase tank /dev/disk/by-id/ata-ST320LT020-9YG142_W0Q408S8-part3
zfs create -o mountpoint=none tank/local
zfs create -o mountpoint=none tank/system
zfs create -o mountpoint=none tank/user
zfs create -o mountpoint=legacy tank/system/root
zfs create -o mountpoint=legacy -o atime=off tank/local/nix
zfs create -o mountpoint=legacy -o xattr=sa -o acltype=posixacl tank/system/var
zfs create -o mountpoint=legacy -o compression=on -o com.sun:auto-snapshot=true tank/user/home
mount -t zfs tank/system/root /mnt
mkdir /mnt/nix /mnt/var /mnt/home
mount -t zfs tank/system/var /mnt/var
mount -t zfs tank/local/nix /mnt/nix
mount -t zfs tank/user/home /mnt/home
head -c 8 /etc/machine-id
