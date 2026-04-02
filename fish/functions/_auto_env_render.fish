function _auto_env_render --on-variable PWD
    if test -f .env.template && not test -f .env.local
        echo "→ Auto-rendering .env.local from pass..."
        env-render
    end
end
