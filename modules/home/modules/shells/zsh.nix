{ ... }: {
  flake.homeModules.shell-zsh = { home, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
    };
  };
}
