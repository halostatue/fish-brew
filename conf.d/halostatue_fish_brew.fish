# @halostatue/fish-brew/conf.d/halostatue_fish_brew.fish:v3.2.1

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

if command --query brew
    set --query --universal __brew_prefix
    and set --erase --universal __brew_prefix

    set --local __brew_prefix (brew --prefix)

    if ! contains -- {$__brew_prefix}/bin $fish_user_paths
        fish_add_path --append --move --path \
            {$__brew_prefix}/bin \
            /usr/local/bin \
            /usr/bin \
            /bin \
            {$__brew_prefix}/sbin \
            /usr/local/sbin \
            /usr/sbin \
            /sbin
    end

    if test -s $HOME/.config/brew/config.fish
        if status is-interactive
            set --local deprecated 0

            if set --query $__halostatue_fish_brew_config_deprecated
                set deprecated $__halostatue_fish_brew_config_deprecated
            end

            if test $deprecated -le 0
                echo >&2 "Sourcing ~/.config/brew/config.fish is deprecated."
                echo >&2 "See https://docs.brew.sh/Manpage#environment for a better alternative."

                set --universal $__halostatue_fish_brew_config_deprecated 10
            else
                set --universal $__halostatue_fish_brew_config_deprecated (math $deprecated - 1)
            end
        end

        source $HOME/.config/brew/config.fish
    end
end

function _halostatue_fish_brew_uninstall -e halostatue_fish_brew_uninstall
    set --universal --erase __brew_prefix __halostatue_fish_brew_config_deprecated
    functions --erase has_cask has_keg (status function)
end
