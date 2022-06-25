# @halostatue/fish-brew/functions/has_keg.fish
function has_keg -d 'Test if the named keg or kegs are installed'
    command --query brew
    or return 1

    argparse A/all -- $argv
    or return 1

    set --query argv[1]
    or return 1

    set --local found 0

    for keg in $argv
        if test -d (brew --prefix)/Cellar/$keg
            set found (math $found + 1)
        end
    end

    if set --query _flag_all
        test $found -eq (count $argv)
    else
        test $found -ne 0
    end
end
