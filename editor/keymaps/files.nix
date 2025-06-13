[
  {
    key = "<leader>w"; # Save the current file
    action = "<cmd>w<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "<leader>r"; # Open NvimTree file explorer
    action = "<cmd>NvimTreeOpen<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "<leader>q"; # Quit all without saving
    action = "<cmd>qa!<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
]

