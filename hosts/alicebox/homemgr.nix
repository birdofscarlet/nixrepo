{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
#------ configuration specific to my desktop PC ------#
{
  ###########################
  #    HOME CONFIGURATION   #
  ###########################

  programs.home-manager.enable = true;
  home.username = "cardinal";
  home.homeDirectory = "/home/cardinal";
  home.stateVersion = "24.05";

  imports = [
    ../../system/packages/discord.nix
    ../../system/core/shell.nix
    ../../system/packages/git.nix
    ../../system/core/niri.nix
  ];

  programs = {
    git.enable = true;
    alacritty.enable = true;
    fuzzel.enable = true;
    swaylock.enable = true;
    firefox.enable = true;
    vim.enable = true;
    dankMaterialShell.enable = true;
  };

  services = {
    wpaperd.enable = true;
    mako = {
      enable = true;
      settings = {
        default-timeout = 8000;
      };
    };
    swayidle.enable = true;
  };



  home.packages = with pkgs; [
    vmware-workstation
    gh
    git-credential-manager
    libsecret
    kdePackages.kate
    qbittorrent
    hyfetch
    fastfetch
    ranger
    pcmanfm
    proton-pass
    aseprite
    audacity
    protonvpn-gui
    wireguard-tools
    gimp
    obs-studio
    prismlauncher
    ringracers
    teams-for-linux
    vlc
    wineWowPackages.wayland
    #wonderdraft
    yt-dlp
    #(pkgs.callPackage ../../system/packages/derivations/dungeondraft.nix {})
  ];
}
