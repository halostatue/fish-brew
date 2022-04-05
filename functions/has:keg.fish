function has:keg -a keg -d 'Return true if the provided keg exists'
    command -sq brew
    or return 1

    test -z $keg
    and return 1

    test -d (brew --prefix)/Cellar/$keg
end
