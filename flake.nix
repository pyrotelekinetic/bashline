{

description = "A PS1 prompt variable generator";

inputs.nixpkgs = {
  type = "github";
  owner = "NixOS";
  repo = "nixpkgs";
  ref = "nixos-23.05";
};

outputs = { self, nixpkgs }: let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in {
  lib = import ./builders.nix pkgs.lib;
};

}
