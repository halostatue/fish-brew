# @halostatue/fish-brew/conf.d/halostatue_fish_brew.fish
#
# Find Homebrew via a known prefix. If the `__homebrew_prefix` universal
# variable is set, that will be set as the first test prefix.
if not command --query brew
    set --local prefixes $HOME/.brew $HOME/.linuxbrew /opt/homebrew /usr/local
    set --query --universal __homebrew_prefix
    and set --prepend prefixes $__homebrew_prefix

    for prefix in $prefixes
        test -x $prefix/bin/brew
        or continue

        set --prepend PATH $prefix/bin
        break
    end
end

set --global --export HOMEBREW_NO_GOOGLE_ANALYTICS 1

command --query brew
or return

set --query --universal __brew_prefix
or set --universal __brew_prefix (brew --prefix)

test -s $HOME/.config/brew/config.fish
and source $HOME/.config/brew/config.fish

fish_add_path --append --move --path \
    {$__brew_prefix}/bin \
    /usr/local/bin \
    /usr/bin \
    /bin \
    {$__brew_prefix}/sbin \
    /usr/local/sbin \
    /usr/sbin \
    /sbin

alias has:cask=has_cask
alias has:keg=has_keg

function _halostatue_fish_brew_uninstall -e halostatue_fish_brew_uninstall
    set --universal --query __brew_prefix
    or return

    set --universal --erase __brew_prefix
    functions --erase has:cask has:keg (status function)
end
