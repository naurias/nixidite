{
  den,
  lib,
  inputs,
  ...
}:
{
  den.aspects.packages = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        services.flatpak.enable = true; # requires xdg-desktop portal to be enabled
        environment.systemPackages = with pkgs; [
          wget
          git
          brightnessctl
          wireguard-tools
          wlr-randr
          kanata
          sops
          xdg-desktop-portal-gnome
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
          xdg-desktop-portal
          age
          ssh-to-age
          compose2nix
        ];
      };
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          # utilitis
          inputs.mermaid-rs-renderer.packages.${pkgs.stdenv.hostPlatform.system}.default
          appimage-run
          coreutils
          unzip
          aria2
          oh-my-posh
          exiftool
          zsh-fzf-tab
          fd
          wl-clipboard
          peazip
          _7zz-rar
          ffmpeg
          ffmpegthumbnailer
          poppler
          fastfetch
          httpie
          jq
          procs
          ripgrep
          tldr
          zip
          graphviz
          go-grip
          mermaid-cli
          maim
          shfmt
          shellcheck
          gnumake
          nodejs
          cmake
          gcc
          php
          python312
          htop
          jujutsu
          lazygit
          # browsers
          brave
          w3m
          # cloud storages
          filen-desktop
          # office and docs
          texliveFull
          pandoc
          kdePackages.okular
          zathura
          kdePackages.qtsvg
          kdePackages.kio-fuse
          buku
          single-file-cli
          obsidian
          opencode
          # file management
          lxqt.pcmanfm-qt
          kdePackages.dolphin
          # media
          mpv
          vlc
          obs-studio
          qbittorrent
          #vesktop
          blender
          # password management
          keepassxc
          # bitwarden-desktop
          # bitwarden-cli
          # development environment and text editors
          ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [ epkgs.vterm ]))
          libvterm
          nixfmt
          prettier

        ];
      };
    provides.pkconf = {
      homeManager =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          programs.firefox = {
            enable = true;
            profiles = {
              nix = {
                isDefault = true;
                id = 0;
                name = "nix";
              };
            };
          };
          # utilities
          programs.btop.enable = true;
          # terminals
          programs.kitty.enable = true;
          # browser
          #programs.zen-browser = {
          #  enable = true;
          #  profiles = {
          #    nix = {
          #      isDefault = true;
          #      extensions = {
          #        force = true;
          #        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          #          ublock-origin
          #          single-file
          #          keepassxc-browser
          #          proton-vpn
          #          karakeep
          #          aria2-integration
          #        ];
          #      };
          #    };
          #  };
          #};

        };
    };
  };
}
