{ config, inputs, pkgs, system, ... }:

{
  home.username = "gartaud";
  home.homeDirectory = "/home/gartaud";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    alacritty
    yazi
    rofi
    feh
    swayfx
    chezmoi
    grim
    slurp
    satty
    hyprlock
    swaynotificationcenter
    swaybg
    waybar
    neovim
    fd
    swayosd
    ripgrep
    autotiling
    zsh
    oh-my-zsh
    inputs.zen-browser.packages."${system}".default
  ];

  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 22;
  };

  programs.zsh.enable = true;
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };

  home.file.".zprofile".text = ''
    export WLR_NO_HARDWARE_CURSORS=1
    exec sway
  '';
  home.file.".zshrc".enable = false;

  home.stateVersion = "24.11";
}
