{ config, pkgs, lib, botcore-v4, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
     # ./services.nix
     botcore-v4.modules.bots
     botcore-v4.modules.frontend
     botcore-v4.modules.dataupdater
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

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.Rory = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      #xterm
    ];
    initialPassword = "password";
  };

  environment.systemPackages = with pkgs; [
    botcore-v4.packages.x86_64-linux.bots
    botcore-v4.packages.x86_64-linux.frontend
    botcore-v4.packages.x86_64-linux.dataupdater
  ];


  system.stateVersion = "22.11"; # DO NOT EDIT!
}

