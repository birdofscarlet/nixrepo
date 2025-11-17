{config, lib, pkgs, inputs, ... }:

{
# emacs is running as a daemon here, accesible via the "emacsclient" command
services.emacs = {
  enable = true;
  package = with pkgs; (
  (emacsPackagesFor emacs).emacsWithPackages (
    epkgs: [ epkgs.elcord ]
  )
);
};



# Home Configuration
programs.emacs = {
  enable = true;
  package = pkgs.emacs;
  extraConfig = ''
    (setq standard-indent 2)
    (setq package-quickstart nil)
    (setq package-menu-async nil)
    (setq package-load-list '(all))


      ;; Ensure the use-package macro is available
      ;; This needs to be the first plugin related settings as
      ;; every pluging that uses this macro in order to use it
      ;; for its own configuration needs to be loaded only after
      ;; this macro has been loaded.
      (require 'use-package)
      (elcord-mode)
      '';
};

}
