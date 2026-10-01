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
flatpak install flathub io.neovim.nvim org.kde.krita org.inkscape.Inkscape io.github.alainm23.planify org.keepassxc.KeePassXC org.prismlauncher.PrismLauncher 
wget https://launcher-pkg-ark-en.yo-star.com/install_pkg/game_launcher/Arknights_EN/Arknights_EN_Gamelauncher-1.8.1-setup.exe

# Caffiene
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

# Give opitions for browsers
printf "Browsers: \n1. Helium \n2. Librewolf \n3. Both \n Which browser(s) to install? [1/2/3/N] "
read choice

case "$choice" in
  1)
    sudo dnf copr enable v8v88v8v88/helium && dnf install helium # Install Browser
    ;;
  2)
    sudo flatpak install flathub io.gitlab.librewolf-community
    ;;
  3)
    sudo dnf copr enable v8v88v8v88/helium && dnf install helium
    sudo flatpak install flathub io.gitlab.librewolf-community
    ;;
  *)
    echo "Cancelled"
    exit 1
    ;;
esac
