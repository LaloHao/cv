{ pkgs ? import <nixpkgs> {} }:
let
  doomPrivateDir = pkgs.stdenv.mkDerivation {
    name = "doom-private";
    src = ./doom.d;
    installPhase = ''
      mkdir $out
      cp -r * $out/
    '';
  };
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = "https://github.com/vlaci/nix-doom-emacs/archive/201e023c671c50c0ee2efe5ca11143161166a736.tar.gz";
    sha256 = "0a9df4sg9bq13zvd6cgc1qidmzd9lll55fx25d9frm5fl7jrn561";
  }) {
    inherit doomPrivateDir;
  };
in doom-emacs 
