[
  {
    key = "<leader>d"; # Go to LSP definition
    action = "<cmd>:lua vim.lsp.buf.definition()<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
]

