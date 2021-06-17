# Find Homebrew via a known prefix. If the `__homebrew_prefix` universal
# variable is set, that will be set as the first test prefix.

if not command -sq brew
    set -l prefixes $HOME/.brew /opt/homebrew /usr/local
    set -qU __homebrew_prefix; and set -p prefixes $__homebrew_prefix

    for prefix in $prefixes
        test -x $prefix/bin/brew; or continue

        set -p PATH $prefix/bin
        break
    end
end

command -sq brew; or exit

set -Uq __brew_prefix; or set -U __brew_prefix (brew --prefix)

test -s $HOME/.config/brew/config.fish; and source $HOME/.config/brew/config.fish

fish_add_path -amP {$__brew_prefix}/bin /usr/local/bin /usr/bin /bin \
    {$__brew_prefix}/sbin /usr/local/sbin /usr/sbin /sbin

function _halostatue_fish_brew_uninstall -e halostatue_fish_brew_uninstall
    set -Uq __brew_prefix; or return
    set -Ue __brew_prefix
    functions -e has:keg (status function)
end
