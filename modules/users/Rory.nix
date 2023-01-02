{ config, pkgs, home-manager, ... }:

{

  users.users.Rory = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
    ];
    initialPassword = "password";
    openssh.authorizedKeys.keys = [
      #"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpmQMHBFOpLfb0Y138VUK1p4FxEPSOz5FRpDK8/eOFwBmEKDjLnT4d/e/Rz2VknCTSKXLMZ4KBMYM014NW3SZR90cDAFwlkdSX638fQlEO3usfALNLWsLbzqzkufw6PKWqrybZvlpwjcacYlRItvit/GH7FLqfiT/G6BdyBErn/lmmcBxF0So0aeba2G/xf7BPPQqqaTqQgE9ml87fdFVw4zVcix823K92SQIx7PkSInpgJwqjLR8cVkL2lkvMdq6IjAEsHAiUYNbAQTUl6xhYa6+Cl8CdvCyINzCpWS3Md2rSH84dZEq0ymZ40orF9JZbHHPgSGFbrg5PUOuJ57iaCPK20z474q2APUJ7aQXiifToZKqcWHFHCj7hqWja1rEt3rQbqRPgttSg5aP3lQ3GXbR/XhdcSYln1QpPTCBxklrfN1P6hF6lWBtGhtGzOvZ5Lt1uofdsK71k5eMwYHTcBnVaMtxbYzR9ihFN6LCNvvnrj+2NvHOiYSCr+y3G4kk= thearcanebrony@DESKTOP-RMRJ2VG"
      #"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICT+53Hy3wbIlNVIomK2RroaimMWrTlUkndjHt1dFuyh root@pfSense-arcane-home.localdomain"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILF2IuNu//0DP/wKMuDvBgVT3YBS2uULsipbdrhJCTM7 thearcanebrony@tab-linux-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN/kNkY/E5b6rvCQLMaSbpLQ/xoyywIwVVu9uo2j/B6p Rory@RoryNix"
    ];
  };

  home-manager.users.Rory = {
    programs.git = {
      enable = true;
      userName = "TheArcaneBrony";
      userEmail = "myrainbowdash949@gmail.com";
    };
  };
}

