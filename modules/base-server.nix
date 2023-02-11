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
    prometheus = {
      exporters = {
        node = {
          enable = true;
          port = 9100;
          enabledCollectors = [
            "logind"
            "systemd"
          ];
          disabledCollectors = [
            #"textfile"
          ];
        };
      };
    };
    promtail = {
      enable = true;
      configuration = {
        server = {
          http_listen_port = 3031;
          grpc_listen_port = 0;
        };
        positions = {
          filename = "/tmp/positions.yaml";
        };
        clients = [{
          url = "https://loki.regional.seian.cloud/loki/api/v1/push";
        }];
        scrape_configs = [{
          job_name = "journal";
          journal = {
            max_age = "12h";
            labels = {
              job = "systemd-journal";
              host = "${toString config.networking.hostName}";
            };
          };
          relabel_configs = [{
            source_labels = [ "__journal__systemd_unit" ];
            target_label = "unit";
          }];
        }];
      };
    };
  };
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11"; # DO NOT EDIT!
}

