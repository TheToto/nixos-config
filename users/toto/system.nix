{ config, pkgs, home-manager, ... }:

{
  users.users.toto = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
}