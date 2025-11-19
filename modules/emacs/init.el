;; i'm good
(setq inhibit-startup-message t)

;; IT'S ALL BLOAT!

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq visible-bell t) ;; shut the fuck up

(load-theme 'wombat)

;; now we get to the real tasty bits
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents ;; unless this archive exists we're going to call
  (package-refresh-contents) ) ;; <--- this so that future pkg mgmt knows what we're talking about

;; in case you're a bitch and not on linux
(unless (package-installed-p 'use-package) ;; -p means predicate function (returns t or nil)
  (package-install 'use-package) ) ;; unless it's already installed, install use-package

(require 'use-package) ;; and then make sure we use it on startup
(setq use-package-always-ensure t) ;; 

(use-package command-log-mode)

(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-ir-black") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-ir-black t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)) )

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package elcord)
(require 'elcord)
(elcord-mode)


