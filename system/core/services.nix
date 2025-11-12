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
  security.rtkit.enable = true;
  services.accounts-daemon.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
