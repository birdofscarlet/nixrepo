{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  ###########################
  #    HOME CONFIGURATION   #
  ###########################

  programs.home-manager.enable = true;
  home.username = "cardinal";
  home.homeDirectory = "/home/cardinal";
  home.stateVersion = "24.05";

  imports = [
    ../../modules/home/discord.nix
    ../../modules/home/shell.nix
    ../../modules/home/git.nix
    ../../modules/home/niri.nix
  ];

  # TODO: all this fuckery can probably get moved somewhere else
  programs = {
    git.enable = true;
    alacritty.enable = true;
    fuzzel.enable = true;
    swaylock.enable = true;
    firefox.enable = true;
    vim.enable = true;
    dankMaterialShell.enable = true;
  };

  #TODO? maybe put this somewhere else too but idk

  home.packages = with pkgs; [
    deadlock-mod-manager
    vmware-workstation
    open-vm-tools
    gh
    git-credential-manager
    libsecret
    davinci-resolve
    love
    kdePackages.dolphin
    appimage-run
    qbittorrent
    slade
    hyfetch
    nixfmt-rfc-style
    lua-language-server
    fastfetch
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
    yt-dlp
  ];
}
