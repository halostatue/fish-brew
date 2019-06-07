function has:keg -a keg
    set -l cellars (find (brew --prefix)/Cellar/$argv[1] -type d -depth 1)
    test (count $cellars) -ne 0
end
