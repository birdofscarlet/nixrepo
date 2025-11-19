{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  # TODO: what to do with these two troublemakers??
  hardware.cpu.amd.updateMicrocode = true;
  virtualisation.vmware.host.enable = true;

  imports = [
    ./hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/desktop.nix
    ../../modules/system/fonts.nix
    ../../modules/system/gaming.nix
    ../../modules/system/graphics-amd.nix
    ../../modules/system/homemgr.nix
    ../../modules/system/locale.nix
    ../../modules/system/network.nix
    ../../modules/system/nix-settings.nix
    ../../modules/system/services.nix
    ../../modules/system/stylix.nix
    ../../modules/system/users.nix
    ../../modules/home/spotify.nix # we gotta load this here for whatever reason
    ../../modules/system/keyd.nix
#    ../../modules/system/storagedrive.nix # uncomment this if you have that second drive free

    # TODO: get this shit out of here v
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {

    extraSpecialArgs = {inherit inputs;};

    users = {
      "cardinal" = import ./home.nix;
    };

    backupFileExtension = "bak";

  };
}
