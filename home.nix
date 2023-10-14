{ config, pkgs, ... }:

{
  home = {
    username = "tushya";
    homeDirectory = "/home/tushya";
    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      firefox
      google-chrome
      neofetch
      vlc
      # nnn # terminal file manager

      # development
      postman

      # archives
      zip
      xz
      unzip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      # exa # A modern replacement for ‘ls’
      # fzf # A command-line fuzzy finder

      # networking tools
      mtr # A network diagnostic tool
      dnsutils  # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      nmap # A utility for network discovery and security auditing

      # misc
      cowsay
      file
      which
      tree
      gnused
      gnutar
      gawk
      zstd
      gnupg

      # nix related
      #
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor

      # productivity
      # hugo # static site generator
      # glow # markdown previewer in terminal

      btop  # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # system call monitoring
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files

      # system tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb
    ];
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };
  programs = {
    # Let home Manager install and manage itself.
    home-manager = {
      enable = true;
    };
    vscode = {
      enable = true;
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.tomoki1207.pdf
        pkgs.vscode-extensions.redhat.vscode-xml
        pkgs.vscode-extensions.redhat.vscode-yaml
      ];
    };
    git = {
      enable = true;
      userName = "bakedSpaceTime";
      userEmail = "tushyais@gmail.com";
      lfs = {
        enable = true;
      };
      # aliases = {
      #   lg1 = "";
      # };
    };
    go = {
      enable = true;
    };
    bash = {
      enable = true;
      enableCompletion = true;
      # TODO add your cusotm bashrc here
      bashrcExtra = ''
        export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      '';

      # set some aliases, feel free to add more or remove some
      shellAliases = {
        k = "kubectl";
        urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
        urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      clock-show-weekday = true;
    };
    # "org/gnome/desktop/background" = {
    #   picture-uri = "file://${wallpaperImg}";
    # };
    "org/gnome/desktop/datetime" = { automatic-timezone = true; };
  };
  gtk = {
  gtk2 = {
    configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    extraConfig = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
  gtk3 = { extraConfig = { gtk-application-prefer-dark-theme = 1; }; };
  gtk4 = { extraConfig = { gtk-application-prefer-dark-theme = 1; }; };
  # starship - an customizable prompt for any shell
  # programs.starship = {
  #   enable = true;
  #   # custom settings
  #   settings = {
  #     add_newline = false;
  #     aws.disabled = true;
  #     gcloud.disabled = true;
  #     line_break.disabled = true;
  #   };
  # };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  # programs.alacritty = {
  #   enable = true;
  #   # custom settings
  #   settings = {
  #     env.TERM = "xterm-256color";
  #     font = {
  #       size = 12;
  #       draw_bold_text_with_bright_colors = true;
  #     };
  #     scrolling.multiplier = 5;
  #     selection.save_to_clipboard = true;
  #   };
  # };
}
