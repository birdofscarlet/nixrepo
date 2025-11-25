/*
The flake name can be omitted if it matches the hostname.

So if you're deploying to a machine named "nixos", naming the flake "nixos" allows you to simply run:

sudo nixos-rebuild switch --flake ~/mysystem
*/
{
  description = "the second incarnation of my nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    niri.url = "github:sodiboo/niri-flake";

    nixcord.url = "github:kaylorben/nixcord";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };

  #-----------------------------------------------------------#

  outputs = {
    self,
    nixpkgs,
    home-manager,
    chaotic,
    emacs-overlay,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      alicebox = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hosts/alicebox/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.spicetify-nix.nixosModules.default
          home-manager.nixosModules.home-manager
          inputs.niri.nixosModules.niri
          chaotic.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cardinal = import ./hosts/alicebox/home.nix;
            home-manager.sharedModules = [
              inputs.dankMaterialShell.homeModules.dankMaterialShell.default
              inputs.nixcord.homeModules.nixcord
            ];
          }
        ];
      };
       alicepad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hosts/alicepad/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.spicetify-nix.nixosModules.default
          home-manager.nixosModules.home-manager
          inputs.niri.nixosModules.niri
          chaotic.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cardinal = import ./hosts/alicepad/home.nix;
            home-manager.sharedModules = [
              inputs.dankMaterialShell.homeModules.dankMaterialShell.default
              inputs.nixcord.homeModules.nixcord
            ];
          }
        ];
      };
    };

    homeConfigurations = {
      homeConfigurations = {
        "alicebox" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {inherit inputs;};
          modules = [
            ./hosts/alicebox/home.nix
          ];
        };
        
         "alicepad" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {inherit inputs;};
          modules = [
            ./hosts/alicepad/home.nix
          ];
        };
      };
    };
  };
}



