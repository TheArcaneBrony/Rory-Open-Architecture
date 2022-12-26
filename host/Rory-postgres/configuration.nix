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

  # environment.systemPackages = with pkgs; [
  #   postgresql
  # ];
  systemd.tmpfiles.rules = [  "d /data/pg 0750 postgres postgres" ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      # TYPE, DATABASE, USER, ADDRESS, METHOD
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
      host discordbots discordbots 192.168.1.1/24 trust
      host all all 0.0.0.0/0 md5
    '';
    # initialScript = pkgs.writeText "backend-initScript" ''
    #   CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
    #   CREATE DATABASE nixcloud;
    #   GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
    # '';
    dataDir = "/data/pg";
  };

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

