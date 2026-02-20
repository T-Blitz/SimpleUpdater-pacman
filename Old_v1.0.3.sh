#!/bin/bash

show_menu() {
    echo "1) Update & Upgrade the System"
    echo "2) Update,Upgrade & Rebooting the System"
    echo "3) Update,Upgrade & Shutting down the System"
    echo "4) Exit"
}

update_and_upgrade_system() {

    # Fetches the latest versions of your package-lists
    # Downloading and installing the updates for each outdated package and dependency on your system
    sudo pacman -Syu --noconfirm
    echo "System upgraded!"
    sleep 0.5

    # Clean up pacman
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm
    sudo pacman -Sc --noconfirm
    echo "System cleaned!" 
    sleep 0.5

    # Upgrade flatpak
    sudo flatpak update -y
    echo "Flatpaks upgraded"
    sleep 0.5
}

update_upgrade_and_shutdown_system(){

    # Update Upgrade and clen up
    update_and_upgrade_system

    # Shutdding down now
    echo "System Upgraded, Shutting down now!"
    sleep 2
    sudo shutdown now

}

update_upgrade_and_reboot_system(){

    # Update Upgrade and clen up
    update_and_upgrade_system

    # Rebooting now
    echo "System Upgraded, Rebooting now!"
    sleep 1
    sudo reboot now

}

# Start of the Script with formating
clear
echo "---> Full System Upgrade-Script V1.0.2 (Arch/pacman) <---"
echo ""
echo $(date)
echo ""
show_menu
echo ""
read -p "Choose an option: " choice
while true; do

    case $choice in
        1)
            update_and_upgrade_system
            sleep 2
            echo ""
            echo "System Upgraded and Cleaned!"
            echo "Clossing Update-Script..."
            echo "Untill next time."
            echo "ᗜˬᗜ"
            echo ""
            break
            ;;
        2)
            update_upgrade_and_reboot_system
            break
            ;;
        3)
            update_upgrade_and_shutdown_system
            break
            ;;
        4)
            clear
            echo "No Updates and/or Upgrades were made. System remains unchanged!"
            echo "Update-Script clossing!..."
            echo "Untill next time."
            echo ""
            echo "ᗜ˰ᗜ"
            break
            ;;
        *)
            clear
            echo "---> Full System Upgrade-Script V1.0.1 (Arch/pacman) <---"
            echo ""
            echo "!WARNING! '$choice' is a invalid option! !WARNING!"
            echo ""
            show_menu
            echo ""
            read -p "Choose an option: " choice
            ;;
    esac
done
