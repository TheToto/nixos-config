{ config, lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
  ];

  programs.gamemode.enable = true;

  # In General / Launch Options
  # gamemoderun %command%
  # mangohud %command%
  # gamescope %command%

  # protonup -d "~/.steam/root/compatibilitytools.d/"
  # Compatibility to use proton GE
}