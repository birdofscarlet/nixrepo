{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
#------ configuration specific to my desktop PC ------#
{
  hardware.cpu.amd.updateMicrocode = true;
  virtualisation.vmware.host.enable = true;
  imports = [
    ./hardware-configuration.nix
    ../../system/core/aliceboxcore.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "cardinal" = import ./homemgr.nix;
    };
  };

  system.stateVersion = "24.11";
}
