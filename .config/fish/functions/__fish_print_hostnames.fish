function __fish_print_hostnames -d "Print a list of known hostnames"
        cat ~/.config/fish/local/dns-zones/* | egrep "\w+\s+(A|CNAME)\s+" | awk '{print $1}'
end
