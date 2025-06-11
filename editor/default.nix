{ inputs, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    viAlias = true;
    vimAlias = true;

    colorschemes.oxocarbon.enable = true;

    # Import your keymaps, plugins, and settings
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;
    extraPlugins = (import ./extraPlugins.nix { inherit pkgs; }); 
    opts = import ./settings.nix;

    # Importiere deinen Lua-Funktions-Code hier
    extraConfigLua = (import ./lua_functions.nix { inherit pkgs; });
  };
}
