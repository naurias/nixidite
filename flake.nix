# NOTE: `nix run .#write-flake` is currently broken upstream (den vs
# vic flake-file URL conflict, pre-existing). Stylix input removed manually
# as part of the migration to den.aspects.theme (runtime theme-switch).
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    den.url = "github:denful/den";
    dotfiles = {
      url = "git+https://github.com/naurias/dot-nix.git";
      flake = false;
    };
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:vic/import-tree";
    live-server-nvim = {
      url = "github:selimacerbas/live-server.nvim";
      flake = false;
    };
    mardown-preview-nvim = {
      url = "github:selimacerbas/markdown-preview.nvim";
      flake = false;
    };
    mermaid-rs-renderer.url = "github:1jehuang/mermaid-rs-renderer";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
