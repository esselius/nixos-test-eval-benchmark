{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs.lib.nixos) evalTest;
      pkgs = builtins.trace "8. pkgs" import nixpkgs { system = "aarch64-darwin"; };

      xx = builtins.trace "1. evaluating test" (evalTest {
        imports = [ (builtins.trace "2. nixos test dot nix" ./nixos-test.nix) ];
        hostPkgs = builtins.trace "3. hostPkgs" pkgs;
      });
    in
    {
      x = builtins.trace "7. build.vm" xx.config.nodes.machine.system.build.vm;
    };
}
