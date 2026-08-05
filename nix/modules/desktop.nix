{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "start-hyprland";
        user = "eluciusftw";
      };
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

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
  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    fuzzel
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
