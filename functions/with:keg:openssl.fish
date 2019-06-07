function __with:keg:openssl:save -a var val
    set -g __with_keg_openssl_$var $$var
    set -gx $var (string escape $val)
end

function __with:keg:openssl:restore
    for var in $argv
        set -l saved __with_keg_openssl_$var
        set -l val (string unescape $$saved)
        set -e $saved

        if test -z $val
            set -e $var
        else
            set -gx $var $val
        end
    end
end

function __with:keg:openssl:run
    __with:keg:openssl:save OPENSSL_ROOT_DIR $root
    __with:keg:openssl:save OPENSSL_LIB_DIR $root/lib
    __with:keg:openssl:save OPENSSL_INCLUDE_DIR $root/include

    set -l result
    set -l cmd $SHELL

    if test -z $argv
        echo OPENSSL_ROOT_DIR $root
        echo OPENSSL_LIB_DIR $root/lib
        echo OPENSSL_INCLUDE_DIR $root/include
        command $cmd
        set result $status
    else
        set cmd $argv
        command $cmd
        set result $status
    end

    __with:keg:openssl:restore OPENSSL_{ROOT,LIB,INCLUDE}_DIR

    return $result
end

function with:keg:openssl
    has:keg openssl
    or begin
        echo 1>&2 Keg OpenSSL is not installed.
        return 1
    end

    set -l root (brew --prefix openssl)

    __with:keg:openssl:run $argv
end
