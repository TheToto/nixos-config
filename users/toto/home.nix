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
    neofetch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq

    # networking tools
    dnsutils  # `dig` + `nslookup`
    nmap # A utility for network discovery and security auditing

    # misc
    file
    tree
    gnupg

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
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