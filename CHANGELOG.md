# fish-brew Changelog

## 3.1.0 / 2025-01-04

- Updated meta configuration.

- Deprecate sourcing `~/.config/brew/config.fish`. Homebrew offers a better
  configuration file (`$XDG_CONFIG_HOME/homebrew/brew.env` or
  `$HOME/.homebrew/brew.env`). A warning will be printed every ten interactive
  sessions _if_ `~/.config/brew/config.fish` exists.

- Modified fish path reordering so that it only occurs _if_ `$brew_prefix/bin`
  is not present in `$fish_user_paths`.

## 3.0.0 / 2023-10-22

- Remove `has:cask` and `has:keg` aliases.

- Update to Contributor Covenant Code of Conduct, [version 2.1][cccoc21].

## 2.5.0 / 2023-07-10

- Remove `HOMEBREW_NO_GOOGLE_ANALYTICS` configuration; the latest version of
  Homebrew no longer uses Google analytics and uses an instance of InfluxDB in
  Europe. No decision has been made on whether those analytics should be
  disabled or not by default.

## 2.4.0 / 2023-02-16

- Added `$HOME/.linuxbrew` to supported Homebrew locations for detection.

- Automatically enable `HOMEBREW_NO_GOOGLE_ANALYTICS`, for Homebrew 4.0+.

## 2.3.0 / 2022-06-24

- Renamed `has:cask` to `has_cask` with an alias so that `has:cask` works as
  expected. `has:cask` will be removed in the next major version.

- Renamed `has:keg` to `has_keg` with an alias so that `has:keg` works as
  expected. `has:keg` will be removed in the next major version.

- Extended `has_cask` and `has_keg` functions to support discovery of one or
  more casks or kegs. The flag `-A` or `--all` may be provided to make these
  functions strict (all casks or kegs must be present).

## 2.2.0 / 2022-04-04

- Reformat scripts
- Add `has:cask` function.
- Simplified the implementation of `has:keg`. It now requires its parameter or
  will return false.

## 2.1.2 / 2021-06-17

- Fix a bug in custom brew configuration loading.

## 2.1.1 / 2021-06-03

- Fix a bug in `has:keg` so that if `brew` is not in `$PATH` it will return
  false, not an error.

## 2.1.0 / 2021-05-21

- If `$HOME/.config/brew/config.fish` exists, it will be sourced during
  initialization. This allows the loading of configuration values like
  `$HOMEBREW_GITHUB_API_TOKEN`. See the `brew` discussion on
  [Environment][Environment] for more details.

## 2.0.1 / 2021-04-17

- Fix a Homebrew detection problem for native Apple Silicon Homebrew. This now
  looks for `$HOME/.brew`, `/opt/homebrew`, then `/usr/local`. If a universal
  variable `$__homebrew_prefix` is set, that will be looked at before
  `$HOME/.brew`.

- Ensure that `{$__brew_prefix}/{,s}bin` are present _before_
  `/usr/local/{,s}bin`.

- Simplify uninstall script.

## 2.0 / 2021-04-15

- Remove `fishfile` and fisher 3 instructions. Installation with fisher 3 still
  works, but is unsupported.

- Switch from `path:unique --append` to the provided function `fish_add_path`.
  This change requires at least Fish 3.2, but no longer requires
  `halostatue/fish-utils-core`. If you are on an older version of Fish, stay
  with the 1.x releases.

- Remove `brew-prefix` function and `__with:keg:openssl`. I haven’t used these
  since I ported them from my zsh profiles.

## 1.3 / 2020-06-13

- Update the `fishfile` dependency on `halostatue/fish-utils` to
  `halostatue/fish-utils-core`.

## 1.2 / 2019-12-30

- Add a `fishfile` dependency on `laughedelic/brew-completions`; there is no
  circumstance that I can foresee where one would want these brew functions
  without the requisite completions.

## 1.1 / 2019-06-27

- Stop handling `$MANPATH`.
- Add a changelog.
- Explain why `$PATH` management is used over `$fish_user_paths`.

## 1.0.5 / 2019-06-17

- Better conditional handling of brew prefixes

## 1.0.4 / 2019-06-10

- Fix an issue with uninstall awk script

## 1.0.3 / 2019-06-10

- Fix an untransformed line

## 1.0.2 / 2019-06-09

- Slight improvements to path handling, plus uninstall

## 1.0.1 / 2019-06-09

- Document and update

## 1.0 / 2019-06-06

- Initial version

[environment]: https://docs.brew.sh/Manpage#environment
[cccoc21]: https://www.contributor-covenant.org/version/2/1/code_of_conduct
