{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
    ];

  networking = {
    hostName = "Rory-postgres";
    interfaces.ens18.ipv4.addresses = [ { 
      address = "192.168.1.3";
      prefixLength = 24;
    } ];
  };

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

