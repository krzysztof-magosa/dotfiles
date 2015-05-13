if [ -f ~/eclipse/eclimd ] ; then
    ps auxw | grep "[o]rg.eclim.application" > /dev/null

    if [ $? = 1 ] ; then
        echo "Starting eclimd instance in background..."
        ~/eclipse/eclimd -b >/dev/null 2>&1
    fi
fi
