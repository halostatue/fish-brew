test -x ~/.brew/bin/brew
and set PATH ~/.brew/bin $PATH

command -sq brew
or exit

set -Uq __brew_prefix
or set -U __brew_prefix (brew --prefix)

if not contains {$__brew_prefix}/bin $PATH
    or not contains {$__brew_prefix}/sbin $PATH
    set -l brew_paths {$__brew_prefix}/bin /usr/bin /bin {$__brew_prefix}/sbin /usr/sbin /sbin

    fish_add_path -amP $brew_paths
end

function _halostatue_fish_brew_uninstall -e halostatue_fish_brew_uninstall
    set -Uq __brew_prefix
    or return

    set -l i (contains -i {$__brew_prefix}/bin $fish_user_paths)
    and set -e fish_user_paths[$i]

    set -l i (contains -i {$__brew_prefix}/sbin $fish_user_paths)
    and set -e fish_user_paths[$i]

    set -Ue __brew_prefix

    functions -e has:keg (status function)
end
