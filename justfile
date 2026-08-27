default:
    {{ just_executable() }} --list

rebuild: validate
    sudo nixos-rebuild switch --flake .

rollback:
    sudo nixos-rebuild switch --rollback --flake .

home: validate
    home-manager switch --flake '.#nick@nicksTab'

validate:
    niri validate -c ./modules/home/modules/niri/config.kdl
