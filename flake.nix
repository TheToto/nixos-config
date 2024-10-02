{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, home-manager, ... }@inputs:
  {
    # Home PC
    nixosConfigurations.bender = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/pc/configuration.nix
        ./hosts/pc/hardware-configuration.nix
        ./hosts/pc/home-manager.nix
      ];
      specialArgs = { inherit inputs; };
    };

    # VM that reproduce home PC
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./disk-configs/classic-disk-config.nix
        /etc/nixos/hardware-configuration.nix
        ./hosts/pc/configuration.nix
        ./common/hyperv.nix
        ./hosts/pc/home-manager.nix
      ];
      specialArgs = { inherit inputs; };
    };

    # Main VPS
    nixosConfigurations.farnsworth = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./disk-configs/lvm-disk-config.nix
        ./hosts/main-vps/hardware-configuration.nix
        ./hosts/main-vps/configuration.nix
      ];
      specialArgs = { inherit inputs; };
    };
  };
}