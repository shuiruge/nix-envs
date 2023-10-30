# shell.nix
with import <nixpkgs> { };
let
  pythonPackages = python3Packages;
in pkgs.mkShell rec {
  name = "impurePythonEnv";
  venvDir = "./.venv";
  buildInputs = [
    # A python interpreter including the 'venv' module is required to bootstrap
    # the environment.
    pythonPackages.python

    # This execute some shell code to initialize a venv in $venvDir before
    # dropping into the shell
    pythonPackages.venvShellHook
  ];

  # Now we can execute any commands within the virtual environment.
  postShellHook = ''

    # Cannot find lib.std.c error:
    # See: https://discourse.nixos.org/t/how-to-solve-libstdc-not-found-in-shell-nix/25458/16
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc}/lib:$LD_LIBRARY_PATH"

    # Cannot find libz.so.1 error:
    # See: https://discourse.nixos.org/t/poetry-pandas-issue-libz-so-1-not-found/17167/6
    # export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    # export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"

    # Run pip.
    # pip install --no-cache-dir -r requirements.txt
    # For Chinese user.
    pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple  
  '';

}
