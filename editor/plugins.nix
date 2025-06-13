{
 lsp = {
    enable = true;
    servers = import ./lsp-servers.nix;
  };
  auto-save.enable = true;
  bufferline.enable = true;
  lsp-format.enable = true;
  coq-nvim.enable = true;
  cmp-nvim-lsp.enable = true;
  lualine.enable = true;
  telescope.enable = true;
  treesitter.enable = true;
  nvim-tree.enable = true;
  luasnip.enable = true;
  cmp_luasnip.enable = true;
  web-devicons.enable = true;
  cmp = {
    enable = true;
    autoEnableSources = true;
 settings = { 
  snippet = {
    expand = "function(args) require('luasnip').lsp_expand(args.body) end";
  };
        sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
        { name = "cmdline"; }
        { name = "nvim_lua"; }
      ];
      
      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
      };
      };
      };
}

