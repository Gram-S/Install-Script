# Rust 
sudo apt install curl build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# make sure ~/.cargo/bin is on your PATH

# General Applications 
sudo apt install neovim
sudo apt install keepassxc
flatpak install flathub org.prismlauncher.PrismLauncher
flatpak install flathub org.godotengine.Godot
flatpak install flathub com.vscodium.codium
sudo apt install blender
flatpak install flathub com.protonvpn.www

# Steam 
# Debian only: enable contrib/non-free and i386 first
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install steam-installer

# cli tools
sudo apt install fastfetch
sudo apt install distrobox podman
cargo install --locked yazi-fm yazi-cli
sudo apt install fd-find ripgrep fzf poppler-utils ffmpeg # yazi dependencies
cargo install ghgrab

# photocraft
sudo apt install libxkbcommon-dev libwayland-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libgtk-3-dev
git clone https://github.com/storytold/photocraft
cd photocraft && cargo build --release -p photocraft
