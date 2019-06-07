test -x ~/.brew/bin/brew; and set PATH ~/.brew/bin $PATH

if command -sq brew
  set -l prefix (brew --prefix)
  set -l brew_paths {$prefix}/bin /usr/bin /bin {$prefix}/sbin /usr/sbin /sbin

  path:unique --append $brew_paths
  path:unique --man --append {$prefix}/share/man
end
