{
  flake-file.inputs = {
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mermaid-rs-renderer = {
      url = "github:1jehuang/mermaid-rs-renderer";
    };
    live-server-nvim = {
      url = "github:selimacerbas/live-server.nvim";
      flake = false;
    };
    mardown-preview-nvim = {
      url = "github:selimacerbas/markdown-preview.nvim";
      flake = false;
    };
  };
}
