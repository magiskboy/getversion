#!/bin/bash

function _check_exectable() {
    executable=$1
    path=$(which $executable)
    [[ -z $path ]] && { echo "$executable not found"; exit 1; }
    [[ ! -x $path ]] && { echo "$executable can't execute"; exit 1; }
    echo $path
}

# =============================== Language =============================

function _python() {
    exectable=$(_check_exectable python)
    [[ $? -eq 0 ]] && {
        x=$(python --version | sed -n "s/\(Python\) \(.*\)/\2/p")
        echo $x
    }
}

function _nodejs() {
    executable=$(_check_exectable nodejs)
    [[ $? -ne 0 ]] && {
        executable=$(_check_exectable node)
    }

    [[ ! -z $executable ]] && {
        x=$($executable --version | sed -n 's/\(v\)\(.*\)/\2/p')
        echo $x
    }

}

function _c() {
    :
}

function _cpp() {
    :
}

function _java() {
    executable=$(_check_exectable javac)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(javac\) \(.*\)/\2/p')
        echo $x
    }
}

function _ruby() {
    executable=$(_check_exectable ruby)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(ruby\) \([0-9]\.[0-9]\.[0-9]\)p\(.*\)/\2/p')
        echo $x
    }
}

function _go() {
    executable=$(_check_exectable go)
    [[ $? -eq 0 ]] && {
        x=$($executable version | sed -n 's/\(go version\) go\([0-9]\.[0-9]\{1,\}\.[0-9]\{1,\}\) \(.*\)/\2/p')
        echo $x
    }
}

function _rust() {
    executable=$(_check_exectable rustc)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(rustc\) \(.*\) \((.*)\)/\2/p')
        echo $x
    }
}

function _perl() {
    executable=$(_check_exectable perl)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(.*\) (v\(.*\))\(.*\)/\2/p')
        echo $x
    }
}

function _php() {
    executable=$(_check_exectable php)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(.*\)PHP \([0-9]\.[0-9]\{1,\}\.[0-9]\{1,\}\)\(.*\)/\2/p')
        echo $x
    }
}

function _r() {
    :
}

function _swift() {
    executable=$(_check_exectable swift)
    [[ $? -eq 0 ]] && {
        x=$($executable -version | sed -n 's/\(.*\) \([0-9]\.[0-9]\.[0-9]\) \(.*\)/\2/p')
        echo $x
    }
}

function _dart() {
    :
}

function _kotlin() {
    :
}

function _scala() {
    :
}

function _julia() {
    :
}

function _lua() {
    executable=$(_check_exectable lua)
    [[ $? -eq 0 ]] && {
        x=$($executable -v | sed -n 's/Lua \([0-9]\.[0-9]\.[0-9]\) \(.*\)/\1/p')
        echo $x
    }
}

# =============================== Package manager =============================

function _pip() {
    executable=$(_check_exectable pip)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/pip \([0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}\) \(.*\)/\1/p')
        echo $x
    }
}

function _pipenv() {
    :
}

function _pyenv() {
    executable=$(_check_exectable pyenv)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/pyenv \([0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}\)/\1/p')
        echo $x
    }
}

function _npm() {
    executable=$(_check_exectable pyenv)
    [[ $? -eq 0 ]] && {
        x=$($executable --version)
        echo $x
    }
}

function _nvm() {
    :
}

function _mvn() {
    executable=$(_check_exectable mvn)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n "s/Apache Maven \([0-9]\.[0-9]\.[0-9]\) \(.*\)/\1/p")
        echo $x
    }
}

function _gradle() {
    :
}

function _gem() {
    executable=$(_check_exectable gem)
    [[ $? -eq 0 ]] && {
        x=$($executable --version 2>/dev/null)
        echo $x
    }
}

function _rbenv() {
    :
}

function _rvm() {
    :
}

function _cargo() {
    executable=$(_check_exectable cargo)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(cargo\) \(.*\) \((.*)\)/\2/p')
        echo $x
    }
}

function _composer() {
    :
}

function _luarocks() {
    executable=$(_check_exectable luarocks)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/\(.*\)\([0-9]\.[0-9]\.[0-9]\)\(.*\)/\2/p')
        echo $x
    }
}

# =============================== Toolset =============================

function _docker() {
    executable=$(_check_exectable docker)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/Docker version \([0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}\), \(.*\)/\1/p')
        echo $x
    }
}

function _minikube() {
    executable=$(_check_exectable minikube)
    [[ $? -eq 0 ]] && {
        x=$($executable version | sed -n 's/minikube version: v\([0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}\)\(.*\)/\1/p')
        echo $x
    }
}

function _git() {
    executable=$(_check_exectable git)
    [[ $? -eq 0 ]] && {
        x=$($executable --version | sed -n 's/git version \(.*\)/\1/p')
        echo $x
    }
}
