{ inputs, config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    discord
    distrobox
    docker
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
    gnome-font-viewer
    gnome-network-displays
    gnumake
    gparted
    grim
    gtk3
    home-manager
    htop
    hypridle
    hyprlock
    hyprland
    hyprshade
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
    xfce.thunar
    xfce.xfwm4
    xwayland
    zoom-us
    zsh
  ];
}