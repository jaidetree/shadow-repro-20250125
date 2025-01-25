{
  description = "shadow-repro-20250125";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = [
          pkgs.clj-kondo
          pkgs.clojure
          pkgs.clojure-lsp
          pkgs.temurin-jre-bin-17
          pkgs.nodejs_23
        ];
        shellHook = ''
          export PATH=$PATH:node_modules/.bin
        '';
      };
    });
}
