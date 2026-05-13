{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_9
    gcc
    git-credential-manager
    gnumake
    lazygit
    lua
    neovim
  ];
}
