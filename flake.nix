# This can be built with nixos-rebuild --flake .#myhost build
{
  description = "Rory's services flake";

  inputs = {
    nixpkgs = {
      # Using the nixos-unstable branch specifically, which is the
      # closest you can get to following the channel with flakes.
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  # Outputs can be anything, but the wiki + some commands define their own
  # specific keys. Wiki page: https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = { self, nixpkgs }: {
    # nixosConfigurations is the key that nixos-rebuild looks for.
    nixosConfigurations = {
      Rory-discordbots = nixpkgs.lib.nixosSystem {
        # A lot of times online you will see the use of flake-utils + a
        # function which iterates over many possible systems. My system
        # is x86_64-linux, so I'm only going to define that
        system = "x86_64-linux";
        # Import our old system configuration.nix
        modules = [
          ./host/Rory-discordbots/configuration.nix
        ];
      };
    };
  };
}