function env-render
    set template .env.template
    if not test -f $template
        echo "No .env.template found in "(pwd)
        return 1
    end
    rm -f .env.local
    while read -l line
        if string match -qr '^[A-Z_]+=pass:.+$' -- $line
            set key (string replace -r '=pass:.+' '' -- $line)
            set pass_path (string replace -r '^[A-Z_]+=pass:' '' -- $line)
            set value (pass $pass_path 2>/dev/null)
            echo "$key=$value" >> .env.local
        else
            echo $line >> .env.local
        end
    end < $template
    echo "→ Rendered .env.local"
end
