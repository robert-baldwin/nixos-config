{
  description = "Personal flake for NixOS desktop and laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    ghostty.url = "git+ssh://git@github.com/mitchellh/ghostty";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ghostty, ... } @ inputs:
    let
      system = "x86_64-linux";
      user = "sprout";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
        };
        modules = [
          ./hosts/configuration.nix
          ./hosts/desktop
          {
            environment.systemPackages = [
              ghostty.packages.x86_64-linux.default
            ];
          }
        ];
      };
      laptop = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
        };
        modules = [
          ./hosts/configuration.nix
          ./hosts/laptop
          {
            environment.systemPackages = [
              ghostty.packages.x86_64-linux.default
            ];
          }
        ];
      };
    };
    homeConfigurations = {
      sprout = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit user;
        };
        modules = [
          ./hosts/home.nix
          hyprland.homeManagerModules.default
          {
            wayland.windowManager.hyprland.enable = true;
          }
        ];
      };
    };
  };
}
