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
      address = "192.168.1.2";
      prefixLength = 24;
    } ];
  };

  services = {
    nginx = {
      enable = true;
      package = pkgs.nginxQuic;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts = {
        "siliconheaven.thearcanebrony.net" = import ./hosts/thearcanebrony.net/siliconheaven.nix;
        "lfs.thearcanebrony.net" = import ./hosts/thearcanebrony.net/lfs.nix;
        "http.thearcanebrony.net" = import ./hosts/thearcanebrony.net/http.nix;
        "thearcanebrony.net" = import ./hosts/thearcanebrony.net/root.nix;
        "sentry.thearcanebrony.net" = import ./hosts/thearcanebrony.net/sentry.nix;
        "awooradio.thearcanebrony.net" = import ./hosts/thearcanebrony.net/awooradio.nix;
        "search.thearcanebrony.net" = import ./hosts/thearcanebrony.net/search.nix;
        "git.thearcanebrony.net" = import ./hosts/thearcanebrony.net/git.nix;
        "files.thearcanebrony.net" = import ./hosts/thearcanebrony.net/files.nix;
        "spigotav.thearcanebrony.net" = import ./hosts/thearcanebrony.net/spigotav.nix;
        "terra.thearcanebrony.net" = import ./hosts/thearcanebrony.net/terra.nix;
        "vives.thearcanebrony.net" = import ./hosts/thearcanebrony.net/vives.nix;
        "*.bots.thearcanebrony.net" = import ./hosts/thearcanebrony.net/bots.nix;
        "lfs.rory.gay" = import ./hosts/rory.gay/lfs.nix;
        "tunnel.rory.boo" = import ./hosts/rory.boo/tunnel.nix;
        "boorunav.com" = import ./hosts/boorunav.com/root.nix;
        "catgirlsaresexy.com" = import ./hosts/catgirlsaresexy.com/root.nix;
        "sugarcanemc.org" = import ./hosts/sugarcanemc.org/root.nix;
      };
    };
  };

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  system.stateVersion = "22.11"; # DO NOT EDIT!
}
