# ---------- Rust (needed by yazi, ghgrab, photocraft) ----------
sudo dnf install rustup gcc
rustup-init -y
# make sure ~/.cargo/bin is on your PATH

# ---------- Neovim ----------
sudo dnf install neovim

# ---------- KeePassXC ----------
sudo dnf install keepassxc

flatpak install flathub org.prismlauncher.PrismLauncher
flatpak install flathub com.vscodium.codium
flatpak install flathub com.protonvpn.www

sudo dnf install godot
sudo dnf install blender

# Steam (needs RPM Fusion)
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install steam

# Cli tools
sudo dnf install distrobox podman
sudo dnf install fastfetch
cargo install --locked yazi-fm yazi-cli
sudo dnf install fd-find ripgrep fzf poppler-utils
# ffmpeg needs RPM Fusion: sudo dnf install ffmpeg
cargo install ghgrab

# build libs below come from a related project's README, so check PhotoCraft's own README
sudo dnf install libxkbcommon-devel wayland-devel libX11-devel libXrandr-devel libXi-devel mesa-libGL-devel gtk3-devel
git clone https://github.com/storytold/photocraft
cd photocraft && cargo build --release -p photocraft
