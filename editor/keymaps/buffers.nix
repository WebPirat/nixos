[
  {
    key = "<Tab>"; # Cycle to next buffer
    action = "<cmd>:BufferLineCycleNext<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "<leader><Tab>"; # Cycle to previous buffer
    action = "<cmd>:BufferLineCyclePrev<cr>";
    options = {
      silent = true;
      noremap = true;
    };
  }
]

