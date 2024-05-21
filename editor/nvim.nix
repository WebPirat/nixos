{ inputs, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
	  globals.mapleader = " ";

    # Enable themes
    #colorschemes.catppuccin.enable = true;
    #colorschemes.catppuccin.settings.flavour = "mocha";

    # Alias
    viAlias = true;
    vimAlias = true;

    keymaps = [	
		  {
        key = "<leader>q";
        options.silent = true;
			  action = "<cmd>qa!<cr>";
      }		
			{
        key = "<leader>w";
        options.silent = true;
			  action = "<cmd>w<cr>";
      }
		  {
        key = "<leader>r";
        options.silent = true;
			  action = "<cmd>NvimTreeOpen<cr>";
      }		
		  {
        key = "<leader>ff";
        options.silent = true;
			  action = "<cmd>Telescope find_files<cr>";
      }
			{
        key = "<leader>fb";
        options.silent = true;
			  action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader>fg";
        options.silent = true;
			  action = "<cmd>Telescope live_grep<cr>";
      }
    ];


    plugins = {
      lsp = {
        enable = true;
        servers = {
				  cssls.enable = true; 
          docker-compose-language-service.enable = true;
          dockerls.enable = true;
					eslint.enable = true;
				  golangci-lint-ls.enable	= true;
					gopls.enable = true;
					html.enable = true;
					htmx.enable = true;
          nil_ls.enable = true;
					phpactor.enable = true;
					sqls.enable = true;
					tailwindcss.enable = true;
					tsserver.enable = true;
					volar.enable = true;
        };
			};

			lsp-format.enable = true;
			coq-nvim.enable = true;

      lualine.enable = true;      
      telescope.enable = true; # fuzzy finder
      treesitter.enable = true;
			nvim-tree.enable = true;
		};  
    opts = {
      number = true; # Show line numbers
			expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      clipboard = "unnamedplus";
    };

  };

}
