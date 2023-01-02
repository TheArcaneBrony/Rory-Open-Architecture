{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
    ];

  networking = {
    hostName = "Rory-devenv";
    interfaces.ens18.ipv4.addresses = [ { 
      address = "192.168.1.254";
      prefixLength = 24;
    } ];
  };

  # environment.systemPackages = with pkgs; [
  #   postgresql
  # ];
  systemd.tmpfiles.rules = [  "d /data/pg 0750 postgres postgres" ];

  services = {
    postgresql = {
      enable = true;
      package = pkgs.postgresql_14;
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        # TYPE, DATABASE, USER, ADDRESS, METHOD
        local all all trust
        host all all 127.0.0.1/32 trust
        host all all ::1/128 trust
        host all all 0.0.0.0/0 md5
      '';
      # initialScript = pkgs.writeText "backend-initScript" ''
      #   CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
      #   CREATE DATABASE nixcloud;
      #   GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
      # '';

      # we dont care about data here - this is a dev env
      #dataDir = "/data/pg";
      settings = {
        "max_connections" = "100";
        "shared_buffers" = "128MB";
        "max_wal_size" = "1GB";
        "min_wal_size" = "80MB";
      };
    };
    xserver = {
      enable = true;
      desktopManager.plasma5 = {
        enable = true;
        #phonon-backend = "gstreamer";
        excludePackages = with pkgs.libsForQt5; [ konsole print-manager khelpcenter oxygen okular gwenview elisa ];
      };
      displayManager.sddm.enable = true;
      displayManager.sddm.autoLogin = {
        enable = true;
        user = "Rory";
      };
      libinput.enable = true;

    };
  };

  users.users = {
    Rory = {
      packages = with pkgs; [ 

       ];
    };
  };

  environment.systemPackages = with pkgs; [
    zsh
    gnome-console
    kitty
    feh
    lsd
    sshfs
    cinnamon.nemo
    firefox-bin
    udisks
    gparted
    glxinfo
  ];
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

