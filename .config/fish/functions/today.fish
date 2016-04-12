function today
        set author (git config user.email)
        git log --since="today 00:00:00" --author="$author" --format=oneline | egrep "\w+ \w+-\d+" | cut -d" " -f 2-
end
