# extraPlugins.nix
{ pkgs }:

[
  (pkgs.vimUtils.buildVimPlugin {
    name = "commit_timer";
    src = ./plugins/commit_timer;
  })
]

