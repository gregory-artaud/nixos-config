{ config, inputs, pkgs, system, ... }:

{
  home.username = "gartaud";
  home.homeDirectory = "/home/gartaud";
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
    inputs.zen-browser.packages."${system}".default
  ];

  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 22;
  };

   programs.zsh = {
     enable = true;
     enableCompletion = true;
     autosuggestion.enable = true;
     syntaxHighlighting.enable = true;

     oh-my-zsh = {
       enable = true;
       plugins = [ ];
       theme = "robbyrussell";
     };
   };

  home.file.".zprofile".text = ''
    export WLR_NO_HARDWARE_CURSORS=1
    exec sway
  '';

  home.stateVersion = "24.11";
}
