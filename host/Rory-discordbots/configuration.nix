{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/base-server.nix
    ];

  networking = {
	hostName = "RoryNix";
	networkmanager.enable = true;
	wireless.enable = false;
  	
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
    wget
    neofetch
    lnav
    pciutils
    zsh
    feh
    git
    lsd
    sshfs
    kitty.terminfo
    vimPlugins.vim-nix
  ];


  system.stateVersion = "22.11"; # DO NOT EDIT!
}

