# Rust stuff - ensure ~/.cargo/bin is on PATH
sudo pacman -S rustup base-devel
rustup default stable

sudo pacman -S neovim
sudo pacman -S keepassxc
sudo pacman -S prismlauncher
sudo pacman -S godot
sudo pacman -S blender
sudo pacman -S krita
yay -S proton-vpn-gtk-app
yay -S vscodium-bin

# steam
# first uncomment [multilib] (both lines) in /etc/pacman.conf, then:
sudo pacman -Sy
sudo pacman -S steam

# ---------- cli tools ----------
sudo pacman -S fastfetch
sudo pacman -S distrobox podman
cargo install --locked yazi-fm yazi-cli
sudo pacman -S fd ripgrep fzf poppler ffmpeg # yazi dependencies
cargo install ghgrab

# photocraft stuff 
sudo pacman -S libxkbcommon wayland libx11 libxrandr libxi mesa gtk3
git clone https://github.com/storytold/photocraft
cd photocraft && cargo build --release -p photocraft
