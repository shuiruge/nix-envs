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

    # Those are dependencies that we would like to use from nixpkgs, which will
    # add them to PYTHONPATH and thus make them accessible from within the venv.
    pythonPackages.requests
    pythonPackages.ipython

    # In this particular example, in order to compile any binary extensions they may
    # require, the python modules listed in the hypothetical requirements.txt need
    # the following packages to be installed locally:
    openssl
  ];

  # Now we can execute any commands within the virtual environment.
  # This is optional and can be left out to run pip manually.
  postShellHook = ''
    pip install --no-cache-dir -r requirements.txt
  '';

}
