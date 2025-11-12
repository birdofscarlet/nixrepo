{
  config,
  pkgs,
  lib,
  imports,
  ...
}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
  environment.systemPackages = with pkgs;
  [
    mangohud
    gamescope
  ];

  services = {
    xserver  = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  environment.variables.AMD_VULKAN_ICD = "RADV";

}
