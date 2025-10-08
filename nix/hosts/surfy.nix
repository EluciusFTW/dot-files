{ pkgs, ... }: {
  programs.hyprland.enable = true;
  services.dbus.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = false; # needed for Steam
    pulse.enable = true;
    jack.enable = false;
  };
  hardware.pulseaudio.enable = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    hack-font
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];
  fonts.fontconfig.antialias = true;

  environment.systemPackages = with pkgs; [
    fuzzel
    hyprlock
    hyprpicker
    kitty
    vivaldi
    vscode
    waybar
    wl-clipboard
    pavucontrol
  ];
}
