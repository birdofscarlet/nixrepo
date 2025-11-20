{config, pkgs, callPackage, ... }:

{

services.emacs = {
  enable = true;
  package = pkgs.emacs; 
};

environment.systemPackages = [
  pkgs.nixd
  pkgs.nixfmt
  
];

}
