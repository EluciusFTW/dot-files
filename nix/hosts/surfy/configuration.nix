{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/desktop.nix
    ../../modules/development.nix
  ];

  # Surfy Wi-Fi requires proprietary firmware
  hardware.firmware = [ pkgs.linux-firmware ];
  hardware.enableRedistributableFirmware = true;

  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    configurationLimit = 5;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings.auto-optimise-store = true;

  networking.hostName = "eftw-surfy";
}
