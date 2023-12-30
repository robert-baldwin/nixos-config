To update the system:
1. Update the flake.lock
2. Build the NixOS system from flake.nix and switch to the new configuration
3. Build user dotfiles using home.nix and switch to the new configuration

```
nix flake update
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```
