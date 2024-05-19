{ inputs, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # Enable themes
    #colorschemes.catppuccin.enable = true;
    #colorschemes.catppuccin.settings.flavour = "mocha";

    # Alias
    viAlias = true;
    vimAlias = true;

    plugins = {
      lsp = {
        enable = true;
        servers = {
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
      lualine.enable = true;      
      telescope.enable = true; # fuzzy finder
      treesitter.enable = true;     	
		};  
    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;
      tabstop = 2;
      clipboard = "unnamedplus";
    };

  };

}
