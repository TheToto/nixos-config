{ config, lib, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./gnome.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  home.username = "toto";
  home.homeDirectory = "/home/toto";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Thomas Lupin";
    userEmail = "mail+git@thetoto.fr";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}