{
  description = "A Flake that can build dry-python returns";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix-src. url = "github:nix-community/poetry2nix";
    returns-src = {
      url = "github:dry-python/returns/499bbdfdab9d81991762d12e900c975dd3d5e040";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils , poetry2nix-src, returns-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ poetry2nix-src.overlay ];
        };
      in rec {
        packages.returns = pkgs.poetry2nix.mkPoetryApplication {
          overrides = pkgs.poetry2nix.defaultPoetryOverrides.extend
             (self: super: {
               m2r2 = super.m2r2.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               sphinx-typlog-theme = super.sphinx-typlog-theme.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               sphinxcontrib-mermaid = super.sphinxcontrib-mermaid.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               slotscheck = super.slotscheck.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.poetry ];
                 }
               );
               sphinxcontrib-jquery = super.sphinxcontrib-jquery.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.flit-core ];
                 }
               );
               sphinx = super.sphinx.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.flit-core ];
                 }
               );
               flake8-commas = super.flake8-commas.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               flake8-quotes = super.flake8-quotes.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               flake8-string-format = super.flake8-string-format.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               flake8-pyi = super.flake8-pyi.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               flake8-rst-docstrings = super.flake8-rst-docstrings.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               sphinx-autodoc-typehints = super.sphinx-autodoc-typehints.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.hatchling super.hatch-vcs ];
                 }
               );
               flake8-broken-line = super.flake8-broken-line.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.poetry ];
                 }
               );
               flake8-comprehensions = super.flake8-comprehensions.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
                 }
               );
               flake8-eradicate = super.flake8-eradicate.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.poetry ];
                 }
               );
               sphinx-hoverxref = super.sphinx-hoverxref.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.flit-core super.setuptools ];
                 }
               );
               wemake-python-styleguide = super.wemake-python-styleguide.overridePythonAttrs
               (
                 old: {
                   buildInputs = (old.buildInputs or [ ]) ++ [ super.poetry ];
                 }
               );
             });
          projectDir = returns-src;
        };
        defaultPackage = packages.returns;
      }
    );
}
