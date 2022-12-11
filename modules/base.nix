{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./packages/vim.nix
      ./users/Rory.nix
      /etc/nixos/hardware-configuration.nix
    ];

  networking = {
	  hostName = lib.mkDefault "Rory-nix-base";
    firewall = {
      enable = false;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };

  #time.timeZone = "Europe/Brussels";
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

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    neofetch
    lnav
    zsh
    git
    lsd
    #sshfs
    kitty.terminfo
    vimPlugins.vim-nix
  ];


  system.stateVersion = "22.11"; # DO NOT EDIT!
}