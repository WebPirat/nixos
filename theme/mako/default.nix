{config, pkgs, ... }: 
{
 programs.mako = {
    enable = true;
    defaultTimeout = 4000;
  };
}