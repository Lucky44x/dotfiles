{ self, inputs, ... }:
{
  flake.nixosConfigurations.nicksTab = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self;
    };

    modules = [
      self.nixosModules.nicksTabConfiguration
      inputs.home-manager.nixosModules.home-manager
      #inputs.nixos-hardware.nixosModules.dell-xps-13-9315

      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.extraSpecialArgs = {
          inherit inputs self;
        };

        home-manager.users.nick = self.homeUsers.nick;
      }
    ];
  };

}
