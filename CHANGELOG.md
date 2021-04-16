# fish-brew Changelog

## 2.0

- Remove `fishfile` and fisher 3 instructions. Installation with fisher
  3 still works, but is unsupported.

- Switch from `path:unique --append` to the provided function `fish_add_path`.
  This change requires at least Fish 3.2, but no longer requires
  `halostatue/fish-utils-core`. If you are on an older version of Fish, stay
  with the 1.x releases.

- Remove `brew-prefix` function and `__with:keg:openssl`. I haven’t used these
  since I ported them from my zsh profiles.

## 1.3

- Update the `fishfile` dependency on `halostatue/fish-utils` to
  `halostatue/fish-utils-core`.

## 1.2

- Add a `fishfile` dependency on `laughedelic/brew-completions`; there is no
  circumstance that I can forsee where one would want these brew functions
  without the requisite completions.

## 1.1

- Stop handling `$MANPATH`.
- Add a changelog.
- Explain why `$PATH` management is used over `$fish_user_paths`.

## 1.0.5

- Better conditional handling of brew prefixes

## 1.0.4

- Fix an issue with uninstall awk script

## 1.0.3

- Fix an untransformed line

## 1.0.2

- Slight improvements to path handling, plus uninstall

## 1.0.1

- Document and update

## 1.0

- Initial version
