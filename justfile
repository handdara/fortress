alias r := run
jd := justfile_directory()

default: _dev-build

# drop into dev shell
develop:
    nix develop --command ghostty

tags:
    ctags -R

run:
    ./build_fortress

_dev-build: tags
    alejandra .
    gfortran -std=f2018 fortress.f90 -o build_fortress
