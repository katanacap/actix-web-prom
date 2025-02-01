{ pkgs, lib, config, inputs, ... }:

{
  packages = [
      pkgs.curl
      pkgs.git
      pkgs.jq
      pkgs.just
      pkgs.tree
      
      ### rust
      pkgs.rustup
      pkgs.sccache
      pkgs.cargo-outdated
      pkgs.cargo-nextest
      pkgs.cargo-audit
  ] ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
       frameworks.SystemConfiguration
       frameworks.Security
       frameworks.CoreFoundation
     ]);

  # https://devenv.sh/languages/
  languages.nix.enable = true;
  languages.rust.enable = true;

  env.RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
