{ den, lib, ... }:
{
  den.aspects.filesystem = {
    nixos =
      {
        config,
        lib,
        pkgs,
        modulesPath,
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
