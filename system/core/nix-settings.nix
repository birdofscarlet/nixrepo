{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  home-manager = {
    backupFileExtension = "bak";
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
}
