{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/desktop.nix
    ../../modules/development.nix
  ];

  # Legacy BIOS bootloader — set device to your VM's primary disk (e.g. "/dev/sda")
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "eftw-vm";
}
