{
  den,
  lib,
  virt,
  de,
  ...
}:
{
  den.aspects.nixreaper = {
    # igloo host provides some home-manager defaults to its users.
    homeManager.programs.direnv.enable = true;

    # NixOS configuration for igloo.
    nixos =
      { pkgs, lib, ... }:
      {
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        nixpkgs.config.allowUnfree = true;
        services.openssh.enable = true;

        time.timeZone = "Asia/Karachi";
        console = {
          font = "Lat2-Terminus16";
          keyMap = "us";
        };
      };

    # <host>.policies.<name>, aspect-included policy
    policies.to-nix =
      { host, user, ... }:
      lib.optional (user.name == "nix") (
        den.lib.policy.include {
          homeManager.programs.tmux.enable = user.name == "nix";
        }
      );

    includes = [
      den.aspects.nixreaper.policies.to-nix
      den.aspects.components
      den.aspects.system

    ];
  };
}
