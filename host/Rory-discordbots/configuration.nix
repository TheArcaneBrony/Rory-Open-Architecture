{ config, pkgs, lib, botcore-v4, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
     # ./services.nix
     botcore-v4.modules.bots
     botcore-v4.modules.frontend
     botcore-v4.modules.dataupdater
     botcore-v4.modules.users
    ];

  networking = {
    hostName = "Rory-discordbots";
    networkmanager.enable = false;
    wireless.enable = false;
      
    firewall = {
      enable = false;
    };
    interfaces.ens18.ipv4.addresses = [ { 
      address = "192.168.1.50";
      prefixLength = 24;
    } ];
  };

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

