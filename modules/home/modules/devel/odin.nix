{ ... }:
{
  flake.homeModules.dev-odin = { pkgs, ... }:
  {
    home.packages = with pkgs; [
      odin
      ols
    ];
  };
}
