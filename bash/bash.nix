{
programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        nixupdate = "sudo nixos-rebuild switch";
        switchnix = "sudo nixos-rebuild switch --flake ~/Documents/nixos#workstation";
        nixgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
        ne = "nix-env";
        ni = "nix-env -iA";
        no = "nixops";
        ns = "nix-shell -p";
        v = "nvim";
        sv = "sudo nvim";
        e = "exit";
        #z
        cd = "z";
        cdi = "zi";
	hw = "home-manager switch";
	hsf = "home-manager switch --flake";
	gp = "git push -u origin main";
	npi = "nix profile install";
	h = "htop";
	gc = "git commit -m";
      };
    };
}
