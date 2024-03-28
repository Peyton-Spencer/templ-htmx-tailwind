#!/bin/bash

# ANSI color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

install_dependency() {
    if command -v "$1" &>/dev/null; then
        # echo -e "${GREEN}$1 is already installed${NC}"
        return 0
    fi
    if ! command -v brew &>/dev/null; then
        echo -e "${YELLOW}Installing brew${NC}"
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash
        brew update
        brew upgrade
    fi
    case $1 in
    "air")
        install_dependency "go"
        # https://github.com/cosmtrek/air
        go install github.com/cosmtrek/air@latest
        ;;
    "go")
        # https://formulae.brew.sh/formula/go#default
        echo -e "${YELLOW}Installing go${NC}"
        brew install go
        ;;
    "gum")
        install_dependency "go"
        # https://github.com/charmbracelet/gum
        # Fancy bash utils
        echo -e "${YELLOW}Installing gum${NC}"
        go install github.com/charmbracelet/gum@latest
        ;;
    "just")
        # https://github.com/casey/just
        echo -e "${YELLOW}Installing just${NC}"
        brew install just
        ;;
    "swag")
        install_dependency "go"
        # https://github.com/swaggo/swag#getting-started
        echo -e "${YELLOW}Installing swaggo${NC}"
        go install github.com/swaggo/swag/cmd/swag@latest
        ;;
    "templ")
        install_dependency "go"
        # https://github.com/a-h/templ
        echo -e "${YELLOW}Installing templ${NC}"
        go install github.com/a-h/templ/cmd/templ@latest
        ;;
    "tailwindcss")
        # https://tailwindcss.com/docs/installation
        echo -e "${YELLOW}Installing tailwindcss${NC}"
        brew install tailwindcss
        ;;
    *)
        echo -e "${RED}Unknown dependency: $1${NC}"
        exit 1
        ;;
    esac
}

if [[ "$#" -eq 0 ]]; then
    echo -e "${RED}Please provide at least one dependency to install.${NC}"
    exit 1
fi

# Iterate over all arguments passed to the script and install each one
for dep in "$@"; do
    install_dependency "$dep"
done
