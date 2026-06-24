{ virt, ... }:
{
  virt.main = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        virtualisation.libvirtd = {
          enable = true;
          qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
        };
        programs.virt-manager.enable = true;
        environment = {
          systemPackages = [ pkgs.qemu ];
        };
      };
    provides.podman = {
      nixos =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          virtualisation = {
            podman = {
              enable = true;
              dockerCompat = true;
            };
          };

          # For containers to access nvidia gpu 
          hardware.nvidia-container-toolkit.enable = true; 
          #run “sudo nvidia-ctk cdi generate”
          #create a container for what you want with the proper flags 'distrobox create --name [whatever you want, I did arch] --image [whatever you want, I used Quay] --additional-flags “–device nvidia.com/gpu=all --security-opt=label=disable” ’
          #try nvidia-smi in the container
          
          environment.systemPackages = with pkgs; [
            podman-compose
            distrobox
            nvidia-container-toolkit # nvidia containers 
          ];
        };
    };
  };
}
