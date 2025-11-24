{config, pkgs, callPackage, ... }:

{

services.emacs = {
  enable = true;
  package = pkgs.emacs-pgtk; 
};

environment.systemPackages = [
  pkgs.nixd
  pkgs.nixfmt
  
];

}
