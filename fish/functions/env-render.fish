function env-render
    set template .env.template
    if not test -f $template
        echo "No .env.template found in "(pwd)
        return 1
    end
    rm -f .env.local
    touch .env.local
    chmod 600 .env.local
    while read -l line
        if string match -qr '^[A-Z0-9_]+=pass:.+$' -- $line
            set key (string replace -r '=pass:.+' '' -- $line)
            set pass_path (string replace -r '^[A-Z0-9_]+=pass:' '' -- $line)
            set value (pass $pass_path 2>/dev/null)
            if test -z "$value"
                echo "✗ Missing pass entry: $pass_path" >&2
            else
                echo "$key=$value" >> .env.local
            end
        else
            echo $line >> .env.local
        end
    end < $template
    echo "→ Rendered .env.local"
end
