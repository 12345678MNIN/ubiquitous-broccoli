#!/data/data/com.termux/files/usr/bin/bash

clear
echo "Which system do you use?"
echo "1) Kali Linux"
echo "2) Termux"
read -p "Select an option (1/2): " system_choice

if [ "$system_choice" = "1" ]; then
    system_name="Kali Linux"
elif [ "$system_choice" = "2" ]; then
    system_name="Termux"
else
    echo "Invalid option. Defaulting to Termux."
    system_name="Termux"
fi

pkg install figlet -y > /dev/null 2>&1
clear
figlet "Infect"
echo "Welcome to your customized $system_name terminal."

while true; do
    echo "Customization Options:"
    echo "1) Change terminal text color"
    echo "2) Set a custom prompt"
    echo "3) Exit"
    echo "4) Start terminal (with loading screen)"
    read -p "Choose an option: " choice

    if [ "$choice" = "1" ]; then
        echo "Available colors: red, green, blue, yellow, cyan, magenta, white"
        read -p "Enter color name: " color
        case $color in
            red) color_code='\e[31m' ;;
            green) color_code='\e[32m' ;;
            blue) color_code='\e[34m' ;;
            yellow) color_code='\e[33m' ;;
            cyan) color_code='\e[36m' ;;
            magenta) color_code='\e[35m' ;;
            white) color_code='\e[37m' ;;
            *) echo "Invalid color, defaulting to white." ; color_code='\e[37m' ;;
        esac
        PS1="${color_code}[custom-terminal]$ \e[0m"
        echo "Color changed."

    elif [ "$choice" = "2" ]; then
        read -p "Enter a custom prompt: " new_prompt
        PS1="\e[32m[$new_prompt]$ \e[0m"
        echo "Prompt changed."

    elif [ "$choice" = "3" ]; then
        echo "Exiting..."
        break

    elif [ "$choice" = "4" ]; then
        clear
        echo "Starting terminal..."
        sleep 1
        for step in "Loading Frames" "Loading Infect" "Loading Customization"; do
            echo -n "$step"
            for i in {1..5}; do
                echo -n "."
                sleep 0.5
            done
            echo " Done!"
        done
        clear
        figlet "INFECT"
        echo "Terminal started. Type your commands below:"
        bash  # Start an interactive shell session
        break

    else
        echo "Invalid option."
    fi
done
