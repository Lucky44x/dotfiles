{ ... }:
{
  flake.homeModules.dev-go = { pkgs, ... }:
  {
    home.packages = with pkgs; [
      go
      gopls
      go
    ];
  };
}
