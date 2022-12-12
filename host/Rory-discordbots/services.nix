{ config, pkgs, lib, ... }:

{
  systemd.services."foo@" = {
    description = "foo";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.foo}/bin/foo";
      User = "foo";
      Group = "foo";
      Restart = "always";
      RestartSec = "5s";
    };
  }
}

