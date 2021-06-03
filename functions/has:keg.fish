function has:keg -a keg
    command -sq brew; or return 1

    set -l cellars (find (brew --prefix)/Cellar/$argv[1] -type d -depth 1)
    test (count $cellars) -ne 0
end
