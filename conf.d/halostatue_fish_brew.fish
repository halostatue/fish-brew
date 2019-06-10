test -x ~/.brew/bin/brew
and set PATH ~/.brew/bin $PATH

if command -sq brew
    set -Uq __brew_prefix
    or set -U __brew_prefix (brew --prefix)

    set -l brew_paths {$__brew_prefix}/bin /usr/bin /bin {$__brew_prefix}/sbin /usr/sbin /sbin

    functions -q path:unique
    and begin
        path:unique --append $brew_paths
        path:unique --man --append {$prefix}/share/man
    end
end

function _halostatue_fish_brew_uninstall -e halostatue_fish_brew_uninstall
    set -Uq __brew_prefix
    or return

    set -l i (contains -i {$__brew_prefix}/bin $fish_user_paths)
    and set -e fish_user_paths[$i]

    set -l i (contains -i {$__brew_prefix}/sbin $fish_user_paths)
    and set -e fish_user_paths[$i]

    set -Ue __brew_prefix

    functions -e (functions -a | command awk '/^__with:keg:openssl')
end
