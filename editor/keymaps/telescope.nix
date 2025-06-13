[
  {
    key = "<leader>ff"; # Find files with Telescope
    action = "<cmd>Telescope find_files<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "<leader>fb"; # List open buffers with Telescope
    action = "<cmd>Telescope buffers<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "<leader>fg"; # Live grep search with Telescope
    action = "<cmd>Telescope live_grep<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
]

