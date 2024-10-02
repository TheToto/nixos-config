{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    vscode
    gnome-extension-manager
    ddcutil
    firefox
    tree
  ];

  # Install ddcci kernel module to change monitor brightness natively on gnome
  boot.extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
  boot.kernelModules = ["ddcci_backlight"];
  hardware.i2c.enable = true;
  services.udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
}