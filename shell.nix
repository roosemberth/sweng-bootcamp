{ pkgs ? import <nixpkgs> {} }:

let
  jdk = pkgs.jdk8;
  androidsdk = pkgs.androidenv.androidsdk_7_1_1_extras;
  fhs = pkgs.buildFHSUserEnv {
    name = "android-env";
    targetPkgs = pkgs: with pkgs; [
      ## Android-studio deps
      # Checked in studio.sh
      coreutils
      findutils
      gnugrep
      which
      gnused

      # For Android emulator
      file
      glxinfo
      pciutils
      xorg.setxkbmap

      # Used during setup wizard
      gnutar
      gzip

      # Crash at startup without these
      fontconfig
      freetype
      xorg.libXext
      xorg.libXi
      xorg.libXrender
      xorg.libXtst

      # Gradle wants libstdc++.so.6
      stdenv.cc.cc.lib
      # mksdcard wants 32 bit libstdc++.so.6
      pkgsi686Linux.stdenv.cc.cc.lib

      # aapt wants libz.so.1
      zlib
      pkgsi686Linux.zlib
      # Support multiple monitors
      xorg.libXrandr

      # For Android emulator
      libpulseaudio
      xorg.libX11
      libGL

      # For GTKLookAndFeel
      gtk2
      gnome2.gnome_vfs
      gnome2.glib
      gnome2.GConf

      # Runtime stuff
      git

      ## Everything else
      androidsdk
      bash
      ncurses
      git
      which
      jdk
    ];
    multiPkgs = pkgs: with pkgs; [
      gst_all_1.gst-plugins-ugly
      gst_all_1.gstreamer
      xlibs.libX11
      xlibs.libXcomposite
      xlibs.libXext
      xlibs.libXfixes
      xlibs.libXrandr
      xlibs.libXtst
      zlib
    ];
    runScript = "bash";
    profile = ''
      export ANDROID_HOME="${androidsdk}/libexec/android-sdk-linux"
      export ANDROID_EMULATOR_FORCE_32BIT=true
      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ANDROID_HOME/tools/lib64
    '';
  };
in
pkgs.stdenv.mkDerivation {
  name = "android-sdk-fhs-shell";
  nativeBuildInputs = [ fhs ];
  shellHook = "exec android-env";
}
