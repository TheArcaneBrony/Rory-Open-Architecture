{ config, pkgs, ... }:

{
  imports =
    [
       ../../../modules/packages/vim.nix
    ];

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
	};
  };

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

  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
 	xserver = {
		enable = true;
  		videoDrivers = [ "intel" ];
  		desktopManager.gnome.enable = true;
		libinput.enable = true;
		layout = "us";
		modules = [ pkgs.xorg.xf86videointel ];
	};
	gnome = {
		
    		core-developer-tools.enable = false;
		core-utilities.enable = false;
		tracker-miners.enable = false;
		tracker.enable = false;
	};

	printing.enable = false;
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
      gnomeExtensions.vitals
      gnomeExtensions.runcat
    ];
    initialPassword = "password";
  };

  environment.systemPackages = with pkgs; [
    wget
    neofetch
    lnav
    pciutils
    zsh
    gnome-console
    feh
    git
    lsd
    #nerdfonts
    #element-web
    sshfs
    cinnamon.nemo
    firefox-bin
    kitty.terminfo
    glxinfo
    #epiphany
    # Various extensions...
    # - Gnome
    #gnomeExtensions.vitals
    #gnomeExtensions.runcat
    #  - Dont work on gnome 43:
    #gnomeExtensions.undecorate
    #gnomeExtensions.inactivity
    #gnomeExtensions.left-clock
    # - Vim
    vimPlugins.vim-nix
  ];
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  system.stateVersion = "22.11"; # DO NOT EDIT!
}

