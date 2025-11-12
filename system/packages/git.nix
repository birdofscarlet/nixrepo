{ config, pkgs, lib, inputs, ... }:
{

  programs.git = {

    package = pkgs.git.override { withLibsecret = true; };
    settings = {
      user.name = "birdofscarlet";
      user.email = "birdofscarlet01@proton.me";
      credential.helper = "libsecret";
    };
  };

}
