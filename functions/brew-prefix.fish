function brew-prefix
    if test (count $argv) -ne 0
        set -l prefix (brew --prefix $argv[1])

        if test $status != 0
            and not test -d $prefix
            set -l cellars (find (brew --prefix)/Cellar/$argv[1] -type d -depth 1)

            test (count $cellars) -ne 0
            and set prefix $cellars[-1]
        end

        if test (string length $prefix) -ne 0
            echo $prefix
        else
            echo 1>&2 "Error: no available formula for $argv."
            return 1
        end
    else
        brew --prefix
    end
end
