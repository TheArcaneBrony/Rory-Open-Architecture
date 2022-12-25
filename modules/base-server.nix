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
        device = "/dev/sda"; # nodev for EFI only
        # EFI
        efiSupport = false;
        efiInstallAsRemovable = false;
      };
      timeout = 0;
    };
  };

  networking = {
	  hostName = lib.mkDefault "Rory-nix-base-server";
    firewall = {
      enable = false;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };

  services = {
	  openssh = {
      enable = true;
      #allow more logins in cases where i have many ssh keys on a system
      extraConfig = ''
        MaxAuthTries 32
        '';
    };	
  };


  system.stateVersion = "22.11"; # DO NOT EDIT!
}

