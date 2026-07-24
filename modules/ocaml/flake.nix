{
  description = "A simple Nix Flake development environment for OCaml";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        name = "ocaml-dev-env";
        packages = with pkgs.ocalmPackages; [
          ocaml
          dune_3
          findlib
          ocaml-lsp
          ocamlformat
          utop
          merlin
        ];
      };
    });
}
