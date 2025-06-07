[
  { key = "i"; options.silent = true; options.noremap = true; action = "k"; }
  { key = "j"; options.silent = true; options.noremap = true; action = "h"; }
  { key = "k"; options.silent = true; options.noremap = true; action = "j"; }
  { key = "l"; options.silent = true; options.noremap = true; action = "l"; }
  { key = "o"; options.silent = true; options.noremap = true; action = "i"; }
  { key = "y"; options.silent = true; options.noremap = true; action = "v"; }
  { key = "x"; options.silent = true; options.noremap = true; action = "d"; }
  { key = "c"; options.silent = true; options.noremap = true; action = "y"; }
  { key = "v"; options.silent = true; options.noremap = true; action = "p"; }
  { key = "u"; options.silent = true; options.noremap = true; action = "Yp"; }

{ key = "z"; options = { silent = true; noremap = true; }; action = "undo"; }
{ key = "Z"; options = { silent = true; noremap = true; }; action = "redo"; }
  { key = "öö"; mode = "i"; options.silent = true; options.noremap = true; action = "<esc>"; }
  { key = "<Tab>"; options.silent = true; options.noremap = true; action = "<cmd>:BufferLineCycleNext<cr>"; }
  { key = "<leader><Tab>"; options.silent = true; options.noremap = true; action = "<cmd>:BufferLineCyclePrev<cr>"; }

  { key = "<leader>d"; options.silent = true; options.noremap = true; action = "<cmd>:lua vim.lsp.buf.definition()<cr>"; }
  { key = "<leader>q"; options.silent = true; options.noremap = true; action = "<cmd>qa!<cr>"; }
  { key = "<leader>w"; options.silent = true; options.noremap = true; action = "<cmd>w<cr>"; }
  { key = "<leader>r"; options.silent = true; options.noremap = true; action = "<cmd>NvimTreeOpen<cr>"; }
  { key = "<leader>ff"; options.silent = true; options.noremap = true; action = "<cmd>Telescope find_files<cr>"; }
  { key = "<leader>fb"; options.silent = true; options.noremap = true; action = "<cmd>Telescope buffers<cr>"; }
  { key = "<leader>fg"; options.silent = true; options.noremap = true; action = "<cmd>Telescope live_grep<cr>"; }
]
