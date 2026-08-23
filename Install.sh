# Requires admins perms to run
sudo -v

# Some terminal configs
echo "export PS1=$'\033[0;32m\W\033[0m \$ '" >> ~/.bashrc

# Git setup
git config --global credential.helper store
read -p "Enter Github Name: " git_name
read -p "Enter Github Name: " git_email
git config user.name $git_name
git config user.email $git_email

# Essentials
sudo flatpak install krita flathub io.github.alainm23.planify org.keepassxc.KeePassXC org.prismlauncher.PrismLauncher com.github.Anuken.Mindustry
sudo dnf install nvim 
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

# My neovim config
git clone https://github.com/Gram-S/dreamer-nvim
mkdir ~/.config/nvim 
mv dreamer-nvim/* $_
rm -rf dreamer-nvim
# sudo venv/bin/python3 main.py remove nodataperm
# rm -rf waydroid_script # For cleanup
