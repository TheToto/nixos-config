{ config, lib, pkgs, ... }:

{
  boot.supportedFilesystems = [ "ntfs" ]; 

  fileSystems."/mnt/Windows" =
    { device = "/dev/disk/by-label/Windows\\x2011";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000" "nofail"];
    };

  fileSystems."/mnt/Data" =
    { device = "/dev/disk/by-label/Data";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000" "nofail"];
    };
}