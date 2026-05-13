{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT    = "de_DE.UTF-8";
    LC_MONETARY       = "de_DE.UTF-8";
    LC_NAME           = "de_DE.UTF-8";
    LC_NUMERIC        = "de_DE.UTF-8";
    LC_PAPER          = "de_DE.UTF-8";
    LC_TELEPHONE      = "de_DE.UTF-8";
    LC_TIME           = "de_DE.UTF-8";
  };

  console.keyMap = "de";

  users.users.eluciusftw = {
    isNormalUser    = true;
    description     = "Guy Buss";
    extraGroups     = [ "networkmanager" "wheel" "audio" ];
    packages        = with pkgs; [];
    initialPassword = "changeme";
  };

  nixpkgs.config.allowUnfree = true;

  security.sudo.wheelNeedsPassword = false;

  environment.sessionVariables = {
    NVIM_APPNAME = "nvim-own";
  };

  programs.git = {
    enable = true;
    config = {
      user.name  = "EluciusFTW";
      user.email = "guysbuss@gmail.com";
      credential.helper = "manager";
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    fastfetch
    fd
    fzf
    git
    ripgrep
    stow
    unzip
    wget
    zoxide
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    hack-font
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];
  fonts.fontconfig.antialias = true;

  system.stateVersion = "24.11";
}
