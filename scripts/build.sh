echo "Building..."
tailwindcss -i ./cmd/web/static/css/input.css -o ./cmd/web/static/css/output.css
templ generate
go build -o main cmd/api/main.go
