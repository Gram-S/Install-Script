# Requires admins perms to run
sudo dnf copr enable v8v88v8v88/helium && dnf install helium # Install Browser
sudo dnf install R && dnf copr enable iucar/rstudio && dnf install rstudio-desktop # R and Rstudio
# dnf install gnome-shell-extension-caffeine # Install Caffeine
sudo flatpak install flathub io.github.alainm23.planify org.keepassxc.KeePassXC org.jellyfin.JellyfinDesktop org.kde.krita org.polymc.PolyMC com.github.Anuken.Mindustry # Various applications I like
sudo dnf install nvim 

# Waydroid 
sudo waydroid init -s GAPPS # Need system OTA and Vendor OTA urls
sudo waydroid shell -- sh -c "sqlite3 /data/data/*/*/gservices.db 'select value from main where name = \"android_id\";'" # Put in https://www.google.com/android/uncertified

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
sudo venv/bin/python3 main.py # Android 13 > Libhoudini & Libdnk?

# Waydroid configs - REQUIRES WAYDROID TO BE RUNNING
waydroid prop set persist.waydroid.fake_touch "*"
waydroid prop set persist.waydroid.width 1600
waydroid prop set persist.waydroid.height 900
waydroid session stop # Must restart the session to apply changes

# IF WAYDROID CRASH OCCURS, CHECK OUT CASUALSNEK. REQUIRES FIDDLING WITH LIBDNK / LIBHOUDINI THROUGH ANDROID 11 OR 13. I REALLY HAVE NO IDEA, JUST TRY STUFF RELATING TO IT. 
# sudo venv/bin/python3 main.py hack nodataperm
# sleep 5m
# sudo venv/bin/python3 main.py remove nodataperm

git config --global credential.helper store
read -p "Enter Github Name: " git_name
read -p "Enter Github Name: " git_email
git config user.name $git_name
git config user.email $git_email
