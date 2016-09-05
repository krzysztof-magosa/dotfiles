# Modified version of https://gist.github.com/wadey/1140259

# Configure by creating array with colors and regexes:
# ITERM_TAB_COLORS=()
# ITERM_TAB_COLORS+=("240 30 30,prod.*")
# ITERM_TAB_COLORS+=("0 240 0,stage.*")

tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

color-ssh() {
    if [[ -n "$ITERM_SESSION_ID" ]] && [[ -n "$ITERM_TAB_COLORS" ]]; then
        trap "tab-reset" INT EXIT

        for item in $ITERM_TAB_COLORS ; do
            regex=$(echo $item | cut -d',' -f2)

            if [[ "$*" =~ "$regex" ]] ; then
                color=$(echo $item | cut -d',' -f1)
                tab-color $(echo $color | cut -d' ' -f1) $(echo $color | cut -d' ' -f2) $(echo $color | cut -d' ' -f3)
                break
            fi
        done
    fi
    ssh $*
}
compdef _ssh color-ssh=ssh

alias ssh=color-ssh
