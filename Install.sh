# Requires admins perms to run
# sudo -v

# Some terminal configs
echo "export PS1='\[\e[32m\]\w\[\e[0m\]\$ ' " >> ~/.bashrc

# Git setup
git config --global credential.helper store
read -p "Enter Github Name: " git_name
read -p "Enter Github Name: " git_email
git config user.name $git_name
git config user.email $git_email

# Essentials
apps=(
  io.neovim.nvim # VScode style?
  io.github.alainm23.planify
  org.keepassxc.KeePassXC
  org.prismlauncher.PrismLauncher
  org.godotengine.Godot
  # com.vscodium.codium # Not sure if needed

  # - Photoshop Applications -
  org.gimp.GIMP # Generic Photoshop
  org.kde.krita # Drawing 
  org.inkscape.Inkscape # Vector based
  # art.darkly.Darkly # Requires testing 
  # Moko when it comes out

  # - Music - 
  # fm.reaper.Reaper # propietary
  # org.ardour.Ardour
  # io.lmms.LMMS
  # com.bitwig.BitwigStudio

  # - Video -
  org.kde.kdenlive
  com.obsproject.Studio

  # - 3D - 
  # org.blender.Blender
)

flatpak install flathub "${apps[@]}"
wget https://launcher-pkg-ark-en.yo-star.com/install_pkg/game_launcher/Arknights_EN/Arknights_EN_Gamelauncher-1.8.1-setup.exe

# Helium install
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install org.freedesktop.Sdk/x86_64/24.08
flatpak-builder --arch=x86_64 --user --install --force-clean build-dir net.imput.helium.yml

# Gnome Extensions
gnome-browser-connector gnome-extensions://caffeine%40patapon.info/?action=install
# Add dashboard here 


# R & R studio install prompt
read -p "Install R/Rstudio? [y/N] " response
case "$response" in
  [yY])
    sudo dnf install R && dnf copr enable iucar/rstudio && dnf install rstudio-desktop 
    # Add R packages to install 
    ;;
  *)
    echo "R install skipped"
    ;;
esac
