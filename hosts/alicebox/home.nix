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
    vmware-workstation
    open-vm-tools
    gh
    git-credential-manager
    libsecret
    kdePackages.kate
    appimage-run
    qbittorrent
    hyfetch
    nixfmt-rfc-style
    fastfetch
    proton-pass
    aseprite
    audacity
    # protonvpn-gui this shit is just broken now?
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
