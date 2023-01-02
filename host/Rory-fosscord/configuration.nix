{ config, pkgs, lib, discord-client-proxy, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
     # ./services.nix
     discord-client-proxy.modules.proxy
     discord-client-proxy.modules.users
    ];

  networking = {
    hostName = "Rory-fosscord";
    networkmanager.enable = false;
    wireless.enable = false;
      
    firewall = {
      enable = false;
    };
    interfaces.ens18.ipv4.addresses = [ { 
      address = "192.168.1.100";
      prefixLength = 24;
    } ];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

