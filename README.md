# halostatue/fish-brew

Configuration and utilities for [Homebrew][] in the [fish shell][].

## Installation

Install with [Fisher][] (recommended):

```fish
fisher install halostatue/fish-brew
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

## Functions

### has:keg

```fish
has:keg openssl
```

Returns true if the named keg is installed.

## License

[MIT](LICENCE.md)

[homebrew]: https://brew.sh
[fish shell]: https://fishshell.com 'friendly interactive shell'
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
