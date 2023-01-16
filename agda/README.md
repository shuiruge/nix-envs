# Agda in Nix

## Setup

1. Create a directory called `src`. **This is the directory where all your source `*.agda` files locates.**
2. Create a file called `.agda-lib` in the same directory as the `shell.nix`, and fill-in:

  ```
  name: <project name>
  include:
    src
  depend:
    standard-library
  ```
  
  where `<project name>` is determined by you.
3. Run `nix-shell` in terminal.

## References

1. The blog [Running Agda with Nix](https://monospacedmonologues.com/2021/05/running-agda-with-nix/) provides a consice illustration of setup of Agda in Nix. This file is based on the blog.
2. [Nixpkgs Manual on Agda](https://ryantm.github.io/nixpkgs/languages-frameworks/agda/).
