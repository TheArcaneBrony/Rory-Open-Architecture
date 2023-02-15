# This can be built with nixos-rebuild --flake .#myhost build
{
  description = "Rory's services flake";

  inputs = {
    nixpkgs = {
      # Using the nixos-unstable branch specifically, which is the
      # closest you can get to following the channel with flakes.
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    botcore-v4 = {
      url = "gitlab:BotCore-Devs/BotCore-v4/staging";
    };
    discord-client-proxy = {
      url = "github:Fosscord/discord-client-proxy";
    };
    home-manager =  {
      url = "github:nix-community/home-manager/master";
    };
  };

  # Outputs can be anything, but the wiki + some commands define their own
  # specific keys. Wiki page: https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = { self, nixpkgs, home-manager, botcore-v4, discord-client-proxy }: {
    # nixosConfigurations is the key that nixos-rebuild looks for.
    nixosConfigurations = {
      Rory-discordbots = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/Rory-discordbots/configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit botcore-v4;
          inherit home-manager;
        };
      };
      Rory-fosscord = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/Rory-fosscord/configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit discord-client-proxy;
          inherit home-manager;
        };
      };
      Rory-postgres = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/Rory-postgres/configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit home-manager;
        };
      };
      Rory-devenv = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/Rory-devenv/configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit home-manager;
        };
      };
      Rory-nginx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/Rory-nginx/configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit home-manager;
        };
      };
    };
  };
}