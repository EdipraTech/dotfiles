{ inputs, config, pkgs, ... }:

{
  #  services.xserver.windowManager.dwm.enable = true;
    #services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    #  src = ./DWMCustom;
  #};
}