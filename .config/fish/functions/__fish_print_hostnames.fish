function __fish_print_hostnames -d "Print a list of known hostnames"
         if test -d ~/.config/fish/local/dns-zones
            cat ~/.config/fish/local/dns-zones/* | egrep "\w+\s+(A|CNAME)\s+" | awk '{print $1}'
         end
end
