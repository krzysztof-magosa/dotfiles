function is_osx() {
         [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

function is_linux() {
         [[ "$OSTYPE" =~ ^linux ]] || return 1
}

