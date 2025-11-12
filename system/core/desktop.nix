{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs = {
    xwayland.enable = true;
    niri.enable = true;
    niri.package = pkgs.niri.overrideAttrs (o: {
      doCheck = false;
    });
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  services.xserver = {
    enable = true;
  };

  services.displayManager.defaultSession = "niri";
  services = {
    libinput.enable = true;

    greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wayland-utils
    wl-clipboard
  ];
}
