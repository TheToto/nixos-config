{ pkgs, ... }:
{
  # https://www.reddit.com/r/NixOS/comments/14suxhk/nixos_on_hyperv_win11/
  services.xserver = { modules = [ pkgs.xorg.xf86videofbdev ]; videoDrivers = [ "hyperv_fb" ]; };
  users.users.gdm = { extraGroups = [ "video" ]; }; 
  users.users.toto = { extraGroups = [ "video" ]; }; 
}