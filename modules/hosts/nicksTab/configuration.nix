{ self, pkgs, ... }:
{
  flake.nixosModules.nicksTabConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.nicksTabHardware
    ];

    # Nix settings
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # System wide packages
    environment.systemPackages = with pkgs; [
      git
      sof-firmware
      alsa-utils
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking and bluetooth
    networking.hostName = "nicksTab";
    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true;

    # Locale / Time
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };

    # Display stack
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;

    # Shell
    # Shell configuration
    programs.zsh.enable = true;
    environment.shells = [ pkgs.zsh ];

    # Main compositor
    programs.niri.enable = true;

    # Fallback desktop
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "gb";
      variant = "";
    };

    # Configure console keymap
    console.keyMap = "uk";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Sound
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig.pipewire."context.properties"."default.clock.quantum" = 1024;
      wireplumber.enable = true;
    };

    hardware.enableAllFirmware = true;

    boot.extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=3
      options snd-sof-intel-hda-common hda_model=dell-headset-multi
    '';

    # Thermals
    # services.thermald.enable = true;
    # services.tlp = {
    #   enable = true;
    #   settings = {
    #     CPU_SCALING_GOVERNOR_ON_AC = "performance";
    #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    #   };
    # };

    # Sensors
    hardware.sensor.iio.enable = true;

    # User Account
    users.users."nick" = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "Nick Balischewski";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

    system.stateVersion = "26.05";
  };
}
