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
          #java-language-server.enable = true;
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
      copilot-vim.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet = { expand = "luasnip"; };

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
          "<CR>" =
            "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<Tab>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
          "<S-Tab>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
      };
    };
      cmp-nvim-lsp.enable = true;

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
