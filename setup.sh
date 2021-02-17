#prepare
echo "Begin setup environment..."

check_command() {
    if command -v $1 >/dev/null 2>&1;then
        echo "check $1 successfully!"
    else
        echo "$1 not found"
        exit -1
    fi
}

check_command curl

#xcode-select
echo "Installing xcode-select..."
xcode-select --install

#homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing tools with Brewfile..."
set +e
export PARH=$PATH:/opt/homebrew/bin
brew bundle
set -e

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"