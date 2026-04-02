#!/usr/bin/env fish

echo "Installing dtg-secrets fish integration..."

set script_dir (dirname (realpath (status --current-filename)))

# Symlink conf.d files
for f in $script_dir/fish/conf.d/*.fish
    set dest ~/.config/fish/conf.d/(basename $f)
    ln -sf $f $dest
    echo "  linked: $dest"
end

# Symlink function files
for f in $script_dir/fish/functions/*.fish
    set dest ~/.config/fish/functions/(basename $f)
    ln -sf $f $dest
    echo "  linked: $dest"
end

echo "Done. Open a new terminal to activate."
