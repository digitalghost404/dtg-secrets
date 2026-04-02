set -gx PASSWORD_STORE_DIR ~/projects/pass-store

if not test -d $PASSWORD_STORE_DIR
    echo "Warning: pass store not found at $PASSWORD_STORE_DIR" >&2
else
    set -gx GITHUB_TOKEN                  (pass api-keys/github-pat 2>/dev/null)
    set -gx GITHUB_PERSONAL_ACCESS_TOKEN  $GITHUB_TOKEN
    set -gx TAVILY_API_KEY                (pass api-keys/tavily 2>/dev/null)
    set -gx ELEVENLABS_API_KEY            (pass api-keys/elevenlabs 2>/dev/null)
    set -gx VOYAGE_API_KEY                (pass api-keys/voyage 2>/dev/null)
end

# Register event-driven hooks at shell startup
source ~/.config/fish/functions/_auto_env_render.fish
