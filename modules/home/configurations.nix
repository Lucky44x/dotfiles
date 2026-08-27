{ self, inputs, ... }:
{
  flake.homeConfigurations."nick@nicksTab" =
  inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

    extraSpecialArgs = {
      inherit inputs self;
    };

    modules = [
      self.homeUsers.nick
    ];
  };
}
