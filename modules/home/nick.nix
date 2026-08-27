{ self, ... }: {
  flake.homeUsers.nick = { pkgs, ... }:
  {
    imports = [
      self.homeModules.shell-zsh

      self.homeModules.niri
      self.homeModules.kitty

      self.homeModules.dev-odin
      self.homeModules.dev-just
      self.homeModules.dev-go
    ];

    home.username = "nick";
    home.homeDirectory = "/home/nick";
    home.stateVersion = "26.05";

    programs.home-manager.enable = true;

    # Enable reusable app modules
    my.home.apps.niri.enable = true;
    my.home.apps.kitty.enable = true;

    # Unconfigured user-packages
    home.packages = with pkgs; [
      fastfetch
      firefox
      zed-editor
      nixd
      nil
    ];
  };
}
