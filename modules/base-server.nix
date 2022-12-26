{ config, pkgs, lib, ... }:

{
  imports =
    [
       ./base.nix
       ./users/chris.nix
    ];

  # My servers always use /dev/sda as boot disk...
  boot = {
    loader = {
      grub = {
        enable = true;
        version = 2;
        devices = [ "/dev/sda" ]; # nodev for EFI only
        # EFI
        efiSupport = false;
        efiInstallAsRemovable = false;
      };
      timeout = 0;
    };
  };

  networking = {
	  hostName = lib.mkDefault "Rory-nix-base-server";
    networkmanager.enable = false;
    wireless.enable = false;
    enableIPv6 = false;
    firewall = {
      enable = false;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };

    useDHCP = false;
    nameservers = [ "1.1.1.1" ];
    defaultGateway = "192.168.1.1";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  services = {
	  openssh = {
      enable = true;
      #allow more logins in cases where i have many ssh keys on a system
      extraConfig = ''
        MaxAuthTries 32
        '';
    };	
  };
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

