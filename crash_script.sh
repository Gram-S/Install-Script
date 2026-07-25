# Script incase waydroid crashes

sudo venv/bin/python3 main.py hack nodataperm # MUST be ran in waydroid_script directory from casualsnek's repo 
sleep 5m
waydroid session stop
sudo python main.py remove nodataperm 
