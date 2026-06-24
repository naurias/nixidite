{
  den,
  lib,
  virt,
  de,
  ...
}:
{
  den.aspects.nix = {

    # Alice can include other aspects.
    # For small, private one-shot aspects, use let-bindings like here.
    # for more complex or re-usable ones, define on their own modules,
    # as part of any aspect-subtree.
    includes =
      let
        # hack for nixf linter to keep findFile :/
        unused = den.lib.take.unused __findFile;
        __findFile = unused den.lib.__findFile;

      in
      [

        # from the aspect tree, cooper example is defined bellow
        den.aspects.nixadmin
        den.aspects.setHost
        # den included batteries that provide common configs.
        <den/primary-user> # alice is admin always.
        (<den/user-shell> "zsh") # default user shell
        # explicit policy activation
        den.aspects.nix.policies.to-nixreaper
        den.aspects.components
      ];

    # Alice configures NixOS hosts it lives on.
    nixos =
      { pkgs, ... }:
      {
        users.users.nix.packages = [ ];
        users.users.nix = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "networkmanager"
            "libvirtd"
            "audio"
            "video"
            "qemu-libvirtd"
            "kvm"
            "input"
            "flatpak"
            "plugdev"
          ];
        };
      };

    # Alice home-manager.
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ ];
        nixpkgs.config.allowUnfree = true;
        #home-manager.backupFileExtension = "hm-backup";
      };

    # <user>.policies.<name>, aspect-included policy
    # Delivers NixOS config to the host (cross-scope via policy.provide).
    policies.to-nixreaper =
      { host, user, ... }:
      lib.optional (host.name == "nixreaper") (
        den.lib.policy.provide {
          class = "nixos";
          module.programs.nh.enable = true;
        }
      );

  };

  # This is a context-aware aspect, that emits configurations
  # **anytime** at least the `user` data is in context.
  # read more at https://den.denful.dev/explanation/parametric/
  den.aspects.nixadmin =
    { user, ... }:
    {
      nixos.users.users.${user.userName}.description = "Nauman Ahmad";
    };

  den.aspects.setHost =
    { host, ... }:
    {
      networking.hostName = host.hostName;
    };
}
