# halostatue/fish-brew

Configuration and utilities for [Homebrew][] in the [fish shell][].

[![Version][]][]

## Installation

Install with [Fisher][] (recommended):

```fish
fisher add halostatue/fish-brew
```

<details>
<summary>Not using a package manager?</summary>

---

Copy `functions/*.fish` and `conf.d/*.fish` to your fish configuration
directory preserving the directory structure.
</details>

### System Requirements

- [fish][] 3.0+
- [Homebrew][] (Linuxbrew _may_ work, but has not been tested)

## Startup Configuration (conf.d)

Adds Homebrew paths to the Fish shell paths. This uses `path:unique` from
[halostatue/fish-utils][] to manage `$PATH`. We do not use `$fish_user_paths`
for this because the correct order for Homebrew paths is:

- `(brew --prefix)/bin`
- `/usr/bin`
- `/bin`
- `(brew --prefix)/sbin`
- `/usr/sbin`
- `/sbin`

If `(brew --prefix)/bin` and `(brew --prefix)/sbin` are placed in
`$fish_user_paths`, then `(brew --prefix)/sbin` would end up being placed
_before_ `/usr/bin`, which might result in odd behaviours.

If Homebrew is installed into `~/.brew` (my preferred installation location
for Homebrew), this will be detected.

## Functions

### brew-prefix

```fish
brew-prefix
brew-prefix openssl
```

An enhanced wrapper around `brew --prefix`.

### has:keg

```fish
has:keg openssl
```

Returns true if the named keg is installed.

### with:keg:openssl

```fish
with:keg:openssl make
```

As the OpenSSL keg is not linked and some applications require it, this
function execute the command with the OpenSSL paths set usefully.

## License

[MIT](LICENCE.md)

[Homebrew]: https://brew.sh
[fish shell]: https://fishshell.com "friendly interactive shell"
[Version]: https://img.shields.io/github/tag/halostatue/fish-brew.svg?label=Version
[![Version][]]: https://github.com/halostatue/fish-brew/releases
[Fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
[halostatue/fish-utils]: https://github.com/halostatue/fish-utils
