{ config, inputs, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "webpirat";
  home.homeDirectory = "/home/webpirat";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  imports = [ 
  	inputs.nixvim.homeManagerModules.nixvim
  	./editor/default.nix
		./theme/default.nix
		./bash
	 ];

  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    thunderbird
		teamviewer
    waybar
		rofi-wayland
    maven
    jdk21
		go
		golangci-lint
		gcc
		ripgrep
		air
		nodePackages_latest.nodejs
		sqlitebrowser
		whatsapp-for-linux
		python3
		google-chrome
		freetube
		spotify
	  playerctl
		git-credential-oauth
    geeqie
    unzip
  ];



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/webpirat/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
 #xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 "/home/<user>/dotfiles/sway/config"
	xdg.configFile = {
    "rofi/config.rasi".source = pkgs.lib.mkOverride 0  (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Dokumente/nixos/theme/rofi/config.rasi");
    "sway/config".source = pkgs.lib.mkOverride 0  (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Dokumente/nixos/theme/sway/config/config");
    "waybar/config.jsonc".source = pkgs.lib.mkOverride 0 (config.lib.file.mkOutOfStoreSymlink "/home/webpirat/Dokumente//nixos/theme/waybar/config/config.jsonc");
    "waybar/style.css".source = pkgs.lib.mkOverride 0 (config.lib.file.mkOutOfStoreSymlink  "/home/webpirat/Dokumente/nixos/theme/waybar/config/style.css");
  };

  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;
}
