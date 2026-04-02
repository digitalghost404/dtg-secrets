function _auto_env_render --on-variable PWD
    if test -f .env.template
        if not test -f .env.local; or test .env.template -nt .env.local
            echo "→ Auto-rendering .env.local from pass..."
            env-render
        end
    end
end
