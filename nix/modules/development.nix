{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_10
    gcc
    git-credential-manager
    gnumake
    lazygit
    lua
    neovim
    claude-code
  ];
}
