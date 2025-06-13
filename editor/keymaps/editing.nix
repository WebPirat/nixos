[
  {
    key = "y"; # Remap 'y' to start visual mode (like 'v')
    action = "v";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "x"; # Remap 'x' to delete (like 'd')
    action = "d";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "c"; # Remap 'c' to yank (like 'y')
    action = "y";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "v"; # Remap 'v' to paste (like 'p')
    action = "p";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "u"; # Remap 'u' to paste with 'Yp'
    action = "Yp";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "z"; # Remap 'z' to undo
    action = "undo";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "Z"; # Remap 'Z' to redo
    action = "redo";
    options = {
      silent = true;
      noremap = true;
    };
  }
  {
    key = "öö"; # In insert mode, 'öö' exits to normal mode (like <esc>)
    mode = "i";
    action = "<esc>";
    options = {
      silent = true;
      noremap = true;
    };
  }
]
