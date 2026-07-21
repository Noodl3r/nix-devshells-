{
  description = "Nix dev shell for C";
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
        name = "c-dev-env";
        packages = with pkgs; [
          clang
          clang-tools
          gdb
          cmake
          gnumake
          ninja
          pkg-config
          lld
          valgrind
        ];
      };
    });
}
