{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./network.nix
    ./user.nix
    ./nix-settings.nix
    ./services.nix
    ./graphics-amd.nix
    ./locale.nix
    ./desktop.nix
    ./stylix.nix
    ./gaming.nix
    ../packages/spotify.nix
    ../packages/vmware.nix
    ../packages/davinci.nix
  ];
}
