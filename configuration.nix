# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixosPC"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  boot.supportedFilesystems = [ "ntfs" ];

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  #NVIDIA
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  environment.etc."mkinitcpio.conf".text = "MODULES(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)";

  # sddm
  services.displayManager.sddm = {
    enable = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

        # ZSH
  users.defaultUserShell=pkgs.zsh;
  programs.zsh = {
      enable = true;
      shellAliases = {
        vim = "nvim";
        ll = "ls -la";
        clc = "clear";
        update = "sudo nixos-rebuild switch";
      };
      ohMyZsh = {
        enable = true;
        #theme = "strug";
        plugins = [
        ];
      };
    };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Docker
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
    };

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # WIRESHARK
  programs.wireshark.enable = true;
  users.groups.wireshark = {};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.edipratech = {
    isNormalUser = true;
    description = "Daniel Arpide";
    extraGroups = [ "networkmanager" "wheel" "video" "kvm" "libvirtd" "docker" "wireshark" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Dark Theme
  environment.variables.GTK_THEME = "Adwaita:dark";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
            auto-cpufreq
            blueman
            brave
            brightnessctl
            btop
            cargo
            ciscoPacketTracer8
            cmake
            davinci-resolve
            discord
	    distrobox
            docker
	    fanctl
            fastfetch 
            feh
            filezilla
	    firefox
            fprintd
            freerdp3
            freetube
            fwupd
            fzf
            gcc
            geekbench
	    gh
            gimp
            git
            glibc
            go
            gnome.gnome-font-viewer
            gnome-network-displays
            gnumake
            gparted
            grim
            gtk3
            home-manager
            htop
            hypridle
            hyprland
            hyprlock
            hyprshade
            icon-library
            jack2
            kicad
            krita
            libreoffice-fresh
            libsecret
            # libsForQt5.kdenlive
            libvirt
            lsd
            lutris
            lxappearance
            lxqt.lxqt-policykit
            mariadb
            meson
            netcat
            # miraclecast
            moonlight-qt
            ninja
            networkmanagerapplet
	    neovim
            nodejs_20
            npins
            obs-studio
	    oh-my-zsh
            openvpn
            parsec-bin
            pavucontrol
            pcsx2
            pipewire
            prismlauncher # minecraft launcher
            python3
            python312Packages.pip
            qemu_kvm
            qjackctl
            qpwgraph
	    rofi
            rustup
            sddm
            slurp
            spotify
            sqlite
	    steam
            swaybg
            swayidle
	    swaylock-effects
	    terminator
            thunderbird
            tldr
            tmux
            tor
            unzip
            virt-manager
            virtiofsd
            vmware-workstation
            vscode
            waybar
            wget
            wireplumber
            wireshark
	    wlsunset
            wofi
            xdg-desktop-portal-gtk
	    xfce.thunar
            xfce.xfwm4
            xwayland
	    zsh
	];
        programs.steam.enable = true;
        virtualisation.vmware.host.enable = true;
        virtualisation.spiceUSBRedirection.enable = true;

        # Logitech Unifying
        hardware.logitech.wireless.enable = true;
        hardware.logitech.wireless.enableGraphical = true;

        # Bluetooth
        hardware.bluetooth.enable = true;

        # Fprint Unlock
        services.fprintd.enable = true;

        # FWUPD
        services.fwupd.enable = true;

        # Home Manager
  #programs.home-manager.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
