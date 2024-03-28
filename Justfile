# Live Reload
@watch: (install air)
	air

# Run the application
run: (install go)
	go run cmd/api/main.go

@build: (install tailwindcss templ go)
	./scripts/build.sh

# Test the application
@test: (install go gum)
	gum log -l info "Testing..."
	go test ./tests -v

# Clean the binary
@clean:
	gum log -l info echo "Cleaning..."
	rm -f main

@install +args:
	./scripts/install-deps.sh {{args}}

air := 'air'
tailwindcss := 'tailwindcss'
templ := 'templ'
go := 'go'
gum := 'gum'