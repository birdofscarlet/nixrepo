{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs = {
    alacritty = {
      settings = {
        window.padding = {
          x = 10; # Horizontal padding
          y = 10; # Vertical padding
        };
        font.size = 12; # Font size
        scrolling.history = 1000; # Scrollback history
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;

      shellAliases = {
        "ll" = "ls -l";
        "la" = "ls -a";
        ".." = "cd ..";
        "re" = "sudo nixos-rebuild switch --flake ~/nixrepo --upgrade-all";
        "dr" = "sudo nixos-rebuild dry-build --flake ~/nixrepo --upgrade-all";
        "cdr" = "cd ~/nixrepo";
        "vr" = "vim ~/nixrepo";
        "nfu" = "cd ~/nixrepo && sudo nix flake update && cd";
        "acp" = "cd ~/nixrepo && git add . && git commit && git push && cd";
      };

      oh-my-zsh = {
        enable = true;
        plugins = ["git"];
        theme = "bureau";
      };

      initContent = "hyfetch";
    };
  };
}
