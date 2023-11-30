# Use Chinese flutter mirror
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

# Install google-chrome
nix-shell -p google-chrome
export CHROME_EXECUTABLE=google-chrome-stable

# Install flutter
nix develop

