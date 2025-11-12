{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };


  system.stateVersion = "24.11";
}
