# Requires admins perms to run
dnf copr enable v8v88v8v88/helium && dnf install helium # Install Browser
dnf install R && dnf copr enable iucar/rstudio && dnf install rstudio-desktop # R and Rstudio
flatpak install flathub com.super_productivity.SuperProductivity org.keepassxc.KeePassXC org.jellyfin.JellyfinDesktop org.kde.krita org.polymc.PolyMC com.github.Anuken.Mindustry # Various applications I like
dnf install nvim 

# My neovim config
git clone https://github.com/Gram-S/dreamer-nvim
mkdir .config/nvim && mv dreamer-nvim/* $_
