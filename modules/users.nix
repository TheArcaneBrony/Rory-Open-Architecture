{ config, pkgs, ... }:

{

  users.users.Rory = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
    ];
    initialPassword = "password";
  };
}

