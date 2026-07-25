# Script incase waydroid crashes

sudo venv/bin/python3 main.py hack nodataperm # MUST be ran in waydroid_script directory from casualsnek's repo 
sleep 2m
waydroid session stop
sudo venv/bin/python3 main.py remove nodataperm

# THis should also work - but must be reran if another game is installed 
#sudo waydroid shell
#chmod 777 -R /sdcard/Android
#chmod 777 -R /data/media/0/Android 
#chmod 777 -R /sdcard/Android/data
#chmod 777 -R /data/media/0/Android/obb 
#chmod 777 -R /mnt/*/*/*/*/Android/data
#chmod 777 -R /mnt/*/*/*/*/Android/obb
#exit
