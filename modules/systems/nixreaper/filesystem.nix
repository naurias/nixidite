{ den, lib, ... }:
{
  den.aspects.filesystem = {
    nixos =
      {
        config,
        lib,
        pkgs,
        modulesPath,
        user,
        ...
      }:
      {
        imports = [
          (modulesPath + "/installer/scan/not-detected.nix")
        ];

        boot.initrd.availableKernelModules = [
          "xhci_pci"
          "ahci"
          "usb_storage"
          "sd_mod"
          "sr_mod"
          "rtsx_usb_sdmmc"
        ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-intel" ];
        boot.extraModulePackages = [ ];

        fileSystems."/" = {
          device = "/dev/disk/by-uuid/7cba7657-db71-4eec-bcd4-dc3911b2413b";
          fsType = "btrfs";
          options = [
            "subvol=@"
            "noatime"
            "compress=zstd"
            "discard=async"
            "space_cache=v2"
            "ssd"
            "commit=120"
          ];
        };

        fileSystems."/home" = {
          device = "/dev/disk/by-uuid/7cba7657-db71-4eec-bcd4-dc3911b2413b";
          fsType = "btrfs";
          options = [
            "subvol=@home"
            "noatime"
            "compress=zstd"
            "discard=async"
            "space_cache=v2"
            "ssd"
            "commit=120"
          ];
        };

        fileSystems."/var" = {
          device = "/dev/disk/by-uuid/7cba7657-db71-4eec-bcd4-dc3911b2413b";
          fsType = "btrfs";
          options = [
            "subvol=@var"
            "noatime"
            "compress=zstd"
            "discard=async"
            "space_cache=v2"
            "ssd"
            "commit=120"
          ];
        };

        fileSystems."/nix" = {
          device = "/dev/disk/by-uuid/7cba7657-db71-4eec-bcd4-dc3911b2413b";
          fsType = "btrfs";
          options = [
            "subvol=@nix"
            "noatime"
            "compress=zstd"
            "discard=async"
            "space_cache=v2"
            "ssd"
            "commit=120"
          ];
        };

        fileSystems."/.snapshots" = {
          device = "/dev/disk/by-uuid/7cba7657-db71-4eec-bcd4-dc3911b2413b";
          fsType = "btrfs";
          options = [
            "subvol=@snapshots"
            "noatime"
            "compress=zstd"
            "discard=async"
            "space_cache=v2"
            "ssd"
            "commit=120"
          ];
        };

        # NOTE: mountpoint follows the den user home (was hardcoded /home/nix).
        # The UUID itself is genuinely host specific, see README portability.
        # NOTE: mountpoint follows the den user name (was hardcoded /home/nix).
        # Only the name is parameterized: the key must stay config free,
        # a config.users lookup here recurses via fileSystems evaluation.
        # The UUID itself is genuinely host specific, see README portability.
        fileSystems."/home/${user.name}/Atlas" = {
          device = "/dev/disk/by-uuid/e5142b34-ca16-46f5-8108-c95bfd137e29";
          fsType = "btrfs";
          options = [ 
            "subvol=@atlas"
            "noatime"
            "compress=zstd"
            "commit=120"
          ];
        };

        fileSystems."/boot" = {
          device = "/dev/disk/by-uuid/B10B-A7C0";
          fsType = "vfat";
          options = [
            "fmask=0022"
            "dmask=0022"
          ];
        };

        swapDevices = [
          { device = "/dev/disk/by-uuid/a2bc935d-3cd0-4d4a-92ef-d428377881fb"; }
        ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      };
  };
}
