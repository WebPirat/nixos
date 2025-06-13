let
  navigation = import ./navigation.nix;
  editing    = import ./editing.nix;
  buffers    = import ./buffers.nix;
  lsp        = import ./lsp.nix;
  files      = import ./files.nix;
  telescope  = import ./telescope.nix;
  custom     = import ./custom.nix;
in

navigation ++ editing ++ buffers ++ lsp ++ files ++ telescope ++ custom

