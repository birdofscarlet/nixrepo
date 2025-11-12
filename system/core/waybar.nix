{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;

    settings = [
      {
        height = 35;
        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [
          "niri/window"
        ];
        modules-right = [
          "tray"
          "clock"
        ];

        # module config

        "tray" = {
          "spacing" = 5;
        };
      }
    ];

    style = ''
      *
             {
             border: solid;
             border-radius: 2px;
             }

             #tray
             {
             }

    '';
  };
}
