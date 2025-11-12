{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
#------ configuration for networking utilities ------#
{
  networking = {
    hostName = "alicebox";

    networkmanager.enable = true;
    firewall.enable = true;
    firewall.checkReversePath = false;
  };
}
