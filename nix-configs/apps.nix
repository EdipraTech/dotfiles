{ config, pkgs, ... }:

{
  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arandr
    blueman
    brave
    brightnessctl
    btop
    cargo
    #ciscoPacketTracer8
    cmake
    coolercontrol.coolercontrol-gui
    coolercontrol.coolercontrol-liqctld
    coolercontrol.coolercontrold
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
    goverlay
    gnome-font-viewer
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
    i3-rounded
    icon-library
    jack2
    kicad
    krita
    libratbag
    libreoffice-fresh
    libsecret
    # libsForQt5.kdenlive
    libvirt
    lsd
    lutris
    lxappearance
    lxqt.lxqt-policykit
    mangohud
    mariadb
    meson
    # miraclecast
    moonlight-qt
    ninja
    networkmanagerapplet
    neovim
    nerdfonts
    nitrogen
    nmap
    nodejs_20
    npins
    obs-studio
    oh-my-zsh
    openvpn
    pamixer
    parsec-bin
    pavucontrol
    pcsx2
    picom
    piper
    pipewire
    prismlauncher # minecraft launcher
    polybar
    pulseaudio
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
}