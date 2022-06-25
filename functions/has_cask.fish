# @halostatue/fish-brew/functions/has_cask.fish
function has_cask -d 'Test if the named cask or casks are installed'
    command --query brew
    or return 1

    argparse A/all -- $argv
    or return 1

    set --query argv[1]
    or return 1

    set --local found 0

    for cask in $argv
        if test -d (brew --prefix)/Caskroom/$cask
            set found (math $found + 1)
        end
    end

    if set --query _flag_all
        test $found -eq (count $argv)
    else
        test $found -ne 0
    end
end
