{ config, inputs, pkgs, ... }:

let
  # Unser eigenes LSP-Script ins PATH legen
  nutsLsp = pkgs.writeShellApplication {
    name = "nuts-lsp";
    runtimeInputs = [ pkgs.nodejs ];
    text = ''
      exec ${pkgs.nodejs}/bin/node /home/webpirat/Documents/nuts-lsp/nuts-lsp.js "$@"
    '';
  };
in {
  home.username = "webpirat";
  home.homeDirectory = "/home/webpirat";
  home.stateVersion = "23.11"; # Bitte nicht ändern ohne Release Notes zu lesen

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./editor/default.nix
    ./theme/default.nix
    ./bash
  ];

  home.packages = with pkgs; [
    thunderbird
    gimp
    waybar
    rofi-wayland
    yarn
    httpie
    maven
    jdk21
    go
    golangci-lint
    gcc
    openssl
    ripgrep
    air
    nodejs              # ersetzt nodePackages_latest.nodejs
    sqlitebrowser
    sqlite
    whatsapp-for-linux
    python3
    google-chrome
    freetube
    filezilla
    feishin
    playerctl
    git-credential-oauth
    insomnia
    # hier unser eigener LSP
    nutsLsp
  ];

  home.file = { };

  home.file.".bashrc".text = ''
    if [ -f "~/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
      source "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
    fi
  '';

  home.sessionVariables = {
    CGO_CFLAGS = "-I${pkgs.openssl.dev}/include";
    CGO_LDFLAGS = "-L${pkgs.openssl.out}/lib";
  };

  xdg.configFile = {
    "rofi/config.rasi".source = pkgs.lib.mkOverride 0 
      (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Documents/nixos/theme/rofi/config.rasi");
    "sway/config".source = pkgs.lib.mkOverride 0  
      (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Documents/nixos/theme/sway/config/config");
    "waybar/config.jsonc".source = pkgs.lib.mkOverride 0 
      (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Documents/nixos/theme/waybar/config/config.jsonc");
    "waybar/style.css".source = pkgs.lib.mkOverride 0  
      (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Documents/nixos/theme/waybar/config/style.css");
  };
}
