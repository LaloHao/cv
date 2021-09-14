{ pkgs ? import <nixpkgs> {} }:
let
  hash = "5f63e20";
in pkgs.stdenv.mkDerivation {
  name = "altacv";
  version = hash;
  src = (builtins.fetchTarball {
    url = "https://github.com/liantze/AltaCV/archive/${hash}.tar.gz";
    # sha256 = "0p0arnbvna2vd6l22y2fhn0893zmymgpg5lsal73vyqllbq7iyl5";
  });
  buildPhase = ":";
  installPhase = ''
    mkdir -p $out/tex/latex/altacv
    cp -r . $out/tex/latex/altacv/
  '';
}
