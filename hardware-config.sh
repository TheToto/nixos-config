#!/usr/bin/env bash

nixos-generate-config --no-filesystems --show-hardware-config | sudo tee /etc/nixos/hardware-configuration.nix > /dev/null
