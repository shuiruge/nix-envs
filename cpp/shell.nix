# shell.nix
with import <nixpkgs> {};
mkShell {
  name = "cppEnv";
  buildInputs = with pkgs; [
    clang-tools
  ];
}
