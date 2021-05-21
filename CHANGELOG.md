# fish-brew Changelog

## 2.1.0 / 2021-05-21

- If `$HOME/.config/brew/config.fish` exists, it will be sourced during
  initialization. This allows the loading of configuration values like
  `$HOMEBREW_GITHUB_API_TOKEN`. See the `brew` discussion on [Environment] for
  more details.

## 2.0.1 / 2021-04-17

- Fix a homebrew detection problem for native Apple Silicon hombrew. This now
  looks for `$HOME/.brew`, `/opt/homebrew`, then `/usr/local`. If a universal
  variable `$__homebrew_prefix` is set, that will be looked at before
  `$HOME/.brew`.

- Ensure that `{$__brew_prefix}/{,s}bin` are present _before_
  `/usr/local/{,s}bin`.

- Simplify uninstall script.

## 2.0 / 2021-04-15

- Remove `fishfile` and fisher 3 instructions. Installation with fisher
  3 still works, but is unsupported.

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
  circumstance that I can forsee where one would want these brew functions
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
