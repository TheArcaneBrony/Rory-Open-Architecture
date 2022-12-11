{ config, pkgs, ... }:

{

  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      nano
      nodejs-slim
    ];
    #initialPassword = "password";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd9U0+wKjBG3Q9Qg249xJY+ybYeRV9/VMPjuwKvFBEI"
    ];
  };
}

