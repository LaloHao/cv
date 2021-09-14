{ pkgs ? import <nixpkgs> {} }:

let
  doom-emacs = import ./emacs.nix {};
  altacv = import ./altacv.nix {};
  src = ''
    *
    !*.org
    !*.png
    !*.el
'';
in pkgs.stdenv.mkDerivation {
  name = "cv";
  version = "2";

  src = pkgs.nix-gitignore.gitignoreSourcePure src ./.;

  buildInputs = [
    pkgs.texlive.combined.scheme-full
    doom-emacs
    altacv
    pkgs.git
    pkgs.gh
  ];

  # unpackPhase = ":";
  buildPhase = ''
    export TEXMFHOME=${altacv}
    export HOME=$(mktemp -d)
    emacs \
      --batch \
      -f toggle-debug-on-error \
      -l init.el \
      README.org -f org-babel-tangle \
      -l setup.el \
      cv.org     -f org-latex-export-to-pdf \
      cv_en.org  -f org-latex-export-to-pdf
    ls -l
  '';

  installPhase = ''
    mkdir -p $out
    cp *pdf $out
  '';
}
