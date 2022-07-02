{
  description = "Sebuah package yang dibuild menggunakan nix dan flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {self, nixpkgs}@inputs:{
    defaultPackage.aarch64-darwin = 
    with import nixpkgs { system = "aarch64-darwin"; };
    stdenv.mkDerivation {
      name = "hello-nix-flake";
      src = self;
      # 
      buildPhase = "echo \"echo apakabar\" > hello-nix-flake; chmod +x hello-nix-flake";

      installPhase = "mkdir -p $out/bin; install -t $out/bin hello-nix-flake";
    };
  };
}
