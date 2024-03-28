./scripts/install-deps.sh go air templ tailwindcss gum just

if [ ! -f cmd/web/static/js/htmx.min.js ]; then
    curl https://unpkg.com/htmx.org@1.9.11/dist/htmx.min.js >cmd/web/static/js/htmx.min.js
else
    gum log -l info "htmx.min.js already downloaded"
fi

if [ ! -f .env ]; then
    cp .env.example .env
    gum log -l info "Copied .env.example to .env"
else
    gum log -l info ".env already exists"
fi
