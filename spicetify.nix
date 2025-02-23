{ pkgs, lib, spicetify-nix, ...}: {
  imports = [ spicetify-nix.homeManagerModule ];

  programs.spicetify = let
    spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  in {
    enable = true;
    injectCss = true;
    replaceColors = true;
    overwriteAssets = true;

    sidebarConfig = true;
    theme = spicePkgs.themes.catppuccin-mocha;
    colorScheme = "flamingo";

    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
      marketplace
      new-releases
    ];

    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
      adblock
      playlistIcons
      historyShortcut
      fullAlbumDate
      groupSession
      powerBar
    ];
  };
}

