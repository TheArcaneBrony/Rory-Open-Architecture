{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
    ];

  networking = {
    hostName = "Rory-nginx";
    networkmanager.enable = false;
    wireless.enable = false;
      
    firewall = {
      enable = false;
    };
    interfaces.ens18.ipv4.addresses = [ { 
      address = "192.168.1.55";
      prefixLength = 24;
    } ];
  };

  services = {
    nginx = {
      enable = true;
      package = pkgs.nginxQuic;
      virtualHosts = {
        #"siliconheaven.thearcanebrony.net" = import ./hosts/thearcanebrony.net/siliconheaven.conf;
        #"lfs.thearcanebrony.net" = import ./hosts/thearcanebrony.net/lfs.conf;
        #"http.thearcanebrony.net" = import ./hosts/thearcanebrony.net/http.conf;
        #"thearcanebrony.net" = import ./hosts/thearcanebrony.net/root.conf;
        #"sentry.thearcanebrony.net" = import ./hosts/thearcanebrony.net/sentry.conf;
        #"awooradio.thearcanebrony.net" = import ./hosts/thearcanebrony.net/awooradio.conf;
        #"search.thearcanebrony.net" = import ./hosts/thearcanebrony.net/search.conf;
        #"git.thearcanebrony.net" = import ./hosts/thearcanebrony.net/git.conf;
        #"files.thearcanebrony.net" = import ./hosts/thearcanebrony.net/files.conf;
        #"spigotav.thearcanebrony.net" = import ./hosts/thearcanebrony.net/spigotav.conf;
        #"terra.thearcanebrony.net" = import ./hosts/thearcanebrony.net/terra.conf;
        "vives.thearcanebrony.net" = import ./hosts/thearcanebrony.net/vives.conf;
        #"bots.thearcanebrony.net" = import ./hosts/thearcanebrony.net/bots.conf;
        #"lfs.rory.gay" = import ./hosts/rory.gay/lfs.conf;
        #"tunnel.rory.boo" = import ./hosts/rory.boo/tunnel.conf;
        #"boorunav.com" = import ./hosts/boorunav.com/root.conf;
        #"catgirlsaresexy.com" = import ./hosts/catgirlsaresexy.com/root.conf;
        #"sugarcanemc.org" = import ./hosts/sugarcanemc.org/root.conf;
      };
    };
  };

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  system.stateVersion = "22.11"; # DO NOT EDIT!
}