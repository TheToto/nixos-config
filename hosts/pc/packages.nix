{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # TODO: reorganize system and user packages
  environment.systemPackages = with pkgs; [
    # gnome related
    gnome-extension-manager

    # useful tools
    git
    vim
    wget
    vscode
    ddcutil

    # browsers
    firefox
    networkmanager-openconnect

    # useful
    plex-media-player
    jetbrains.idea-ultimate
    beeper
    onlyoffice-bin
    vlc

    # other
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
    
    # media
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    appindicator
    gsconnect
  ];

  services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];

  # Install ddcci kernel module to change monitor brightness natively on gnome
  boot.extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
  boot.kernelModules = ["ddcci_backlight"];
  hardware.i2c.enable = true;
  services.udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
}