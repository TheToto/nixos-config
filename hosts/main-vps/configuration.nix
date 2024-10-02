{
  modulesPath,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./portainer-docker.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMfv5K9/mqa2eNVAk8XQrTXW1kVKDfB4pr26faUpmWA3"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC/TCqBgro14ZusUXE8UrhVK8TX+5LSVSRTWoXLq+sjFO5cD6R2+mPKFLQOqztIdfMZvOKntMjxNInXswdJkwNMbZwL/zwjLbBtiTuC0kS4PK1+Umb1UEvT/wdexdvtVJ1jyqyTYQItSWyG0HxYpXACjTE70CbEEnWuCTJnKCC9jioq+hvaTvvuA9flf5RhbvjGzuUpHtETrCK7XIRNjG7jB8CCC3bDSsQEnIgV3y8MEj3BD0FOAzCCMK0CWr14SSu6V1cr3Sp7DzjOD7mJnqPbQmkcUnHG+hQ8bWHH4wroCle8D0NJ7J5jbH5aif4gjja1waDKCU/m/CWCu+iQh8L"
  ];

  system.stateVersion = "24.05";
}