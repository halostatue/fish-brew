# halostatue/fish-brew

[![Version][]](https://github.com/halostatue/fish-brew/releases)

Configuration and utilities for [Homebrew][] in the [fish shell][].

## Installation

Install with [Fisher][] (recommended):

```fish
fisher install halostatue/fish-brew@v2.x
```

<details>
<summary>Not using a package manager?</summary>

---

Copy `functions/*.fish` and `conf.d/*.fish` to your fish configuration
directory preserving the directory structure.

</details>

### System Requirements

- [fish][] 3.2+
- [Homebrew][]

## Startup Configuration (conf.d)

Adds Homebrew paths to `$PATH`. This uses the `fish_add_path` function included
with Fish 3.2. This is not set in `$fish_user_paths` because the correct order
for Homebrew paths is:

- `(brew --prefix)/bin`
- `/usr/local/bin`
- `/usr/bin`
- `/bin`
- `(brew --prefix)/sbin`
- `/usr/local/sbin`
- `/usr/sbin`
- `/sbin`

If `(brew --prefix)/bin` and `(brew --prefix)/sbin` are placed in
`$fish_user_paths`, then `(brew --prefix)/sbin` would end up being placed
_before_ `/usr/bin`, which might result in odd behaviours.

If Homebrew is installed into `~/.brew`, this will be detected.

If `$HOME/.config/brew/config.fish` exists, it will be sourced during
initialization. This allows the loading of configuration values like
`$HOMEBREW_GITHUB_API_TOKEN`. See the `brew` discussion on [Environment][] for
more details.

## Functions

### has:keg

```fish
has:keg openssl
```

Returns true if the named keg is installed.

### has:cask

```fish
has:cask macvim
```

Returns true if the named cask is installed.

## Licence

[MIT](./LICENCE.md)

## Change Log

[CHANGELOG](./CHANGELOG.md)

## Contributing

- [Contributing](./CONTRIBUTING.md)
- [Contributors](./CONTRIBUTORS.md)
- [Code of Conduct](./CODE_OF_CONDUCT.md)

[homebrew]: https://brew.sh
[fish shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-brew.svg?label=Version
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
[environment]: https://docs.brew.sh/Manpage#environment
