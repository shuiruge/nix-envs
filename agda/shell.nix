# shell.nix
{ pkgs ? import <nixpkgs> { } }: with pkgs;
mkShell {
  name = "agdaEnv";
  buildInputs = [
    # Agda and Agda packages.
    # By default, Agda's standard library is not installed together with Agda.
    (agda.withPackages {
      pkgs = [
        agdaPackages.standard-library
      ];
      # Other options, e.g. ghc = ...;
    })

    # Other packages. 
    emacs
  ];
  postShellHook = ''
    agda-mode setup  # if use emacs.
  '';
}

