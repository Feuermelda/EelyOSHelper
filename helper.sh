#!/bin/bash


cat << "EOF"
(°U°))))))             )))))             )))))>
         )))))     )))))   )))))     )))))
             ))))))            ))))))
EOF

echo -e "\nHello \033[1;33m$USER\033[0m, welcome to \033[1;32mEely OS Helper\033[0m!\n"
helping=1

while [ $helping -eq 1 ];

do
echo -e "\nHow can I help you, \033[1;33m$USER\033[0m?\n"
echo "1. View system status"
echo "2. Backup folder"
echo "3. Process Scheduling Simulation"
echo "4. Clean temp folder and log action"
echo "5. View log.txt"
echo "6. Hardware Info"
echo "7. Memory Monitor"
echo "8. Network Tools"
echo -e "9. Quit\n"
echo -e "\033[1;36mWhat do you want to do?\033[0m"
read -p "Pick a number: " choice
if [ $choice -eq 1 ]; then
echo -e "Current System Status:\n"
top -b -n1 | head -n 10

echo "$(date): system status viewed." >> log.txt
elif [ $choice -eq 2 ]; then
read -p "Enter folder to back up: " folder
if [ -d "$folder" ]; then
if zip -r backup_$(date +%F).zip "$folder"; then
echo "Backup complete"
echo "$(date): Backup of $folder complete." >> log.txt
else
echo "Backup failed!"
echo "$(date): Backup of $folder FAILED." >> log.txt
fi
else
echo -e "\033[1;31mFolder not found: $folder\033[0m"
fi
elif [ $choice -eq 3 ]; then
python3 round-robin-sim.py
echo "$(date): Round-Robin Process Scheduling simulated." >> log.txt
elif [ $choice -eq 4 ]; then
echo "Cleaning .tmp files..."
find "$HOME" -name '*.tmp' -delete
echo -e "All tmp files deleted!\nNow logging action..."
echo "$(date): Temp files deleted." >> log.txt
elif [ $choice -eq 5 ]; then
file="log.txt"
while read -r line; do
echo -e "$line\n"
done<$file
elif [ $choice -eq 6 ]; then
echo "CPU Model: $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs)"
echo "CPU cores: $(nproc)"
echo "Total RAM: $(free -h | awk '/^Mem:/ {print $2}')"
elif [ $choice -eq 7 ]; then
echo -e "Top memory-using processes:\n"
ps aux --sort=-%mem | head -n 6
elif [ $choice -eq 8 ]; then
echo "Network"
python3 pingmap.py
echo -e "\nNetstat:"
netstat -tuln
echo -e "\nnslookup google:\n"
nslookup google.com
elif [ $choice -eq 9 ]; then
helping=0
else
echo -e "\033[1;31mInvalid choice.\033[0m"
fi
sleep 1
done
echo -e "\nThanks for visiting, \033[1;33m$USER\033[0m! Please visit again!\n"
