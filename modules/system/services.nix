{
  config,
  lib,
  pkgs,
  ...
}: {
  ############
  # SERVICES #
  ############

  services.flatpak.enable = true;
  services.printing.enable = true;
  services.accounts-daemon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
}
