{
  pkgs,
  config,
  lib,
  ...
}: {
  devShells.default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [nixpkgs-fmt];
  };
}
