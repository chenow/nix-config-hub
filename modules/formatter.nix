{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nix-config-hub.formatter;
in {
  options.nix-config-hub.formatter.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable treefmt with specified formatters.";
  };

  config = lib.mkIf cfg.enable {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        alejandra.enable = true; # nix formatter
        mdformat.enable = true; # markdown formatter
        jsonfmt.enable = true; # json formatter
        shfmt.enable = true; # shell formatter
        yamlfmt.enable = true; # yaml formatter
      };
      settings.excludes = [".direnv/*" "*.lock"];
    };
  };
}
