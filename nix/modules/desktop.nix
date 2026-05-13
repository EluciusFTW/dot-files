{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.dbus.enable = true;

  xdg.portal.enable       = true;
  xdg.portal.wlr.enable   = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  security.rtkit.enable = true;

  services.pipewire = {
    enable           = true;
    alsa.enable      = true;
    alsa.support32Bit = false;
    pulse.enable     = true;
    jack.enable      = false;
  };
  hardware.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    fuzzel
    hyprlock
    hyprpicker
    kitty
    nushell
    pavucontrol
    starship
    vivaldi
    vscode
    waybar
    wezterm
    wl-clipboard
  ];
}
