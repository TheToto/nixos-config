{ config, lib, pkgs, home-manager, ... }:

{
  users.users.toto = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };
}