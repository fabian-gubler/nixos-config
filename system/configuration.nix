{ config, pkgs, ... }:



let
  # TODO: should be imported from initial flake
  user = "fabian";

in
{
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.efi.canTouchEfiVariables = true;

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  fileSystems."/data" = {
    device = "data"; # Replace this with the correct device path
    fsType = "virtiofs"; # Replace this with the correct filesystem type
    options = [ "defaults" ];
  };


  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # protects nix shell against garbage collection
    extraOptions = ''
        keep-outputs = true
          keep-derivations = true
      	  '';
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Display Server
  services.xserver = {
    enable = true;
    layout = "ch";
    windowManager.dwm.enable = true;
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "fabian";
      defaultSession = "none+dwm";
    };
  };

  services.atd.enable = true;

  time.timeZone = "Europe/Zurich";

  # TODO: System-wide GTK Theme
  qt5 = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  # Use same keyboard layout for tty
  console.useXkbConfig = true;

}
