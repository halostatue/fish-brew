# halostatue/fish-brew

[![Version][version]](https://github.com/halostatue/fish-brew/releases)

Configuration and utility functions for [Homebrew][homebrew] in the
[fish shell][shell].

## Installation

Install with [Fisher][fisher]:

```fish
fisher install halostatue/fish-brew@v3
```

### System Requirements

- [fish][fish] 3.4+
- [Homebrew][homebrew]

## Startup Configuration (`conf.d`)

The configuration file for fish-brew will detect the presence of the `brew`
executable and place the Homebrew binary paths in `$PATH`.

> The `brew` paths will be resolved from `$HOME/.brew`, `$HOME/.linuxbrew`,
> `/opt/homebrew`, or `/usr/local`. An additional path can be searched by
> setting the universal variable `$__homebrew_prefix`.

### `$PATH` Configuration

If `(brew --prefix)/bin` is found in `$fish_user_paths`, `$PATH` configuration
will be skipped. Note that putting `(brew --prefix)/{,s}bin` in
`$fish_user_paths` is not recommended, as `(brew --prefix)/sbin` may be placed
before `/usr/bin`, potentially resulting in odd behaviours.

The correct ordering of Homebrew paths with default paths is:

- `(brew --prefix)/bin`
- `/usr/local/bin`
- `/usr/bin`
- `/bin`
- `(brew --prefix)/sbin`
- `/usr/local/sbin`
- `/usr/sbin`
- `/sbin`

> If using MacPorts, I recommend using [halostatue/fish-macports][macports] in
> addition to fish-brew to ensure that Homebrew and MacPorts paths are placed in
> the correct order.

### Homebrew Configuration

> This feature is deprecated and will be removed in fish-brew@v4. It is
> recommended that the local Homebrew environment files be used instead, as
> described in [Environment][env].
>
> A deprecation warning will be printed every ten interactive sessions if
> `$HOME/.config/brew/config.fish`.

If `$HOME/.config/brew/config.fish` exists, it will be sourced during
initialization. This allows the loading of configuration values like
`$HOMEBREW_GITHUB_API_TOKEN`.

## Functions

### `has_keg`

```fish
has_keg openssl
```

Returns true if the named keg is installed.

### `has_cask`

```fish
has_cask macvim
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

[env]: https://docs.brew.sh/Manpage#environment
[fish]: https://github.com/fish-shell/fish-shell
[fisher]: https://github.com/jorgebucaran/fisher
[homebrew]: https://brew.sh
[macports]: https://github.com/halostatue/fish-macports
[shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-brew.svg?label=Version
