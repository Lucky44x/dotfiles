{ ... }:
{
  flake.homeModules.niri = { config, lib, pkgs, ... }:
  let
    cfg = config.my.home.apps.niri;
  in
  {
    options.my.home.apps.niri = {
      enable = lib.mkEnableOption "Niri home configuration";

      configFile = lib.mkOption {
        type = lib.types.path;
        default = ./config.kdl;
        description = "Path to the Niri configuration file";
      };
    };

    config = lib.mkIf cfg.enable {
      xdg.configFile."niri/config.kdl".source = cfg.configFile;

      home.packages = with pkgs; [
        fuzzel
        libnotify
      ];
    };
  };
}
