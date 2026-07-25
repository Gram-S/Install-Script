# Requires admins perms to run
sudo -i
dnf copr enable v8v88v8v88/helium && dnf install helium # Install Browser
dnf install R && dnf copr enable iucar/rstudio && dnf install rstudio-desktop # R and Rstudio
# dnf install gnome-shell-extension-caffeine # Install Caffeine
flatpak install flathub io.github.alainm23.planify org.keepassxc.KeePassXC org.jellyfin.JellyfinDesktop org.kde.krita org.polymc.PolyMC com.github.Anuken.Mindustry # Various applications I like
dnf install nvim 

# Waydroid 
waydroid init -s GAPPS # Need system OTA and Vendor OTA urls
waydroid shell -- sh -c "sqlite3 /data/data/*/*/gservices.db 'select value from main where name = \"android_id\";'" # Put in https://www.google.com/android/uncertified
exit # Leave root shell

# My neovim config
git clone https://github.com/Gram-S/dreamer-nvim
mkdir ~/.config/nvim 
mv dreamer-nvim/* $_
rm -rf dreamer-nvim

# Wait for 5 minutes for waydroid to sync with google 
sleep 5m 
waydroid session stop

git clone https://github.com/casualsnek/waydroid_script
cd waydroid_script
python3 -m venv venv
venv/bin/pip install -r requirements.txt
sudo venv/bin/python3 main.py # Select libhoudini

# IF WAYDROID CRASH OCCURS USE CRASH SCRIPT 
