# CI checks against the real topology (nixreaper host, nix user).
# Run with `nix flake check` once the write-flake pin is fixed.
{ inputs, ... }:
{
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    let
      checkCond = name: cond: pkgs.runCommandLocal name { } (if cond then "touch $out" else "");
      nixreaper = inputs.self.nixosConfigurations.nixreaper.config;
      nix-at-nixreaper = nixreaper.home-manager.users.nix;
      homePkgs = nix-at-nixreaper.home.packages;
      hasPkg = name: lib.any (p: (p.name or "") == name) homePkgs;
      kvconfigs = builtins.filter (n: lib.hasSuffix ".kvconfig" n) (
        builtins.attrNames nix-at-nixreaper.xdg.configFile
      );
    in
    {
      checks."nixreaper enables nh" = checkCond "nixreaper.nh" nixreaper.programs.nh.enable;
      checks."nix enables tmux" = checkCond "nix.tmux" nix-at-nixreaper.programs.tmux.enable;
      checks."theme-switch installed" =
        checkCond "theme-switch" (hasPkg "theme-switch");
      checks."theme store listed" =
        checkCond "themes.list" (nix-at-nixreaper.xdg.configFile ? "mytheme/themes.list");
      checks."kvantum themes complete" =
        checkCond "kvantum-count" (10 == builtins.length kvconfigs);
    };
}
