{ inputs, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    viAlias = true;
    vimAlias = true;

    # Importiere die aufgeteilten Konfigurationen
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;
    opts = import ./settings.nix;
  };
}

