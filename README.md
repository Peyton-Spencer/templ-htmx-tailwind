# templ-go-std

Templ and HTMX are all the rage! This template has your favorites: Go, Templ, HTMX, TailwindCSS, and Justfile.

## Getting Started

```bash
git clone git@github.com:Peyton-Spencer/templ-go-std.git

./install.sh
```


## Commands

List the commands
```bash
just -l
```

live reload the application
```bash
just watch
```
Open your browser to http://localhost:8080

run the test suite
```bash
just test
```

Build the production binary
```bash
just build
```

Run the production binary
```bash
just start
```
or
```bash
./main
```

clean up binary from the last build
```bash
just clean
```