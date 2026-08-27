{ ... }:
{
  flake.homeModules.kitty = { config, lib, pkgs, ... }:
  let
    cfg = config.my.home.apps.kitty;
  in
  {
    options.my.home.apps.kitty = {
      enable = lib.mkEnableOption "Kitty home configuration";

      configFile = lib.mkOption {
        type = lib.types.path;
        default = ./kitty.conf;
        description = "Path to the kitty configuration file";
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        kitty
      ];

      xdg.configFile."kitty/kitty.conf".source = cfg.configFile;
    };
  };
}
