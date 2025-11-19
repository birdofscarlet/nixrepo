{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
  };
  
 };
  
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

}
