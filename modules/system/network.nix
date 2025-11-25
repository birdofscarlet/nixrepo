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

    networkmanager.enable = true;
    firewall.enable = true;
    firewall.checkReversePath = false;
  };
}
