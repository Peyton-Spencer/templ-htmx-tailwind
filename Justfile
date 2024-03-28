# Live Reload
@watch: (_install air)
	air
alias w := watch

# Build the binary
@build: (_install tailwindcss templ go)
	./scripts/build.sh
alias b := build

# Start the binary
start:
	./main

# Test the application
@test: (_install go gum)
	gum log -l info "Testing..."
	go test ./tests -v

# Clean the binary
@clean:
	gum log -l info "Cleaning..."
	rm -f main

@_install +args:
	./scripts/install-deps.sh {{args}}

air := 'air'
tailwindcss := 'tailwindcss'
templ := 'templ'
go := 'go'
gum := 'gum'