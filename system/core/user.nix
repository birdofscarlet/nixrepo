{
  config,
  lib,
  pkgs,
  ...
}: {
  #########
  # USERS #
  #########
  programs.zsh.enable = true;

  users.users.cardinal = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "cardinal";
    extraGroups = ["networkmanager" "wheel" "adbusers"];
  };
}
