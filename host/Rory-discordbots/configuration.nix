{ config, pkgs, lib, botcore-v4, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
     # ./services.nix
    ];

  networking = {
    hostName = "Rory-discordbots";
    networkmanager.enable = false;
    wireless.enable = false;
      
    firewall = {
      enable = false;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
    interfaces.ens18.ipv4.addresses = [ { 
      address = "192.168.1.50";
      prefixLength = 24;
    } ];
  };

  #time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    openssh = {
            enable = true;
            extraConfig = ''
              MaxAuthTries 32
              '';
    };	
  };
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;

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
    botcore-v4.packages.x86_64-linux.default
  ];


  system.stateVersion = "22.11"; # DO NOT EDIT!
}

