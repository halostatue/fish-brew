function has:cask -a cask -d 'Return true if the provided cask exists'
    command -sq brew
    or return 1

    test -z $cask
    and return 1

    test -d (brew --prefix)/Caskroom/$cask
end
