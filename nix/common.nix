{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.git = {
    enable = true;
    config = {
      user.name = "EluciusFTW";
      user.email = "guysbuss@gmail.com";
      credential.helper = "manager";
    };
  };

  security.sudo.wheelNeedsPassword = false;

  # Locale & time
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  console.keyMap = "de";

  # User account
  users.users.eluciusftw = {
    isNormalUser = true;
    description = "Guy Buss";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Environment variables
  environment.sessionVariables = {
    NVIM_APPNAME = "nvim-own";
  };

  # CLI/dev packages
  environment.systemPackages = with pkgs; [
    dotnet-sdk_9
    git
    git-credential-manager
    lazygit
    fastfetch
    neovim
    nushell
    starship
    stow
    wget
    zoxide
    ripgrep
    fd
    fzf
    unzip
    curl
    gcc
    gnumake
    lua
  ];
}
