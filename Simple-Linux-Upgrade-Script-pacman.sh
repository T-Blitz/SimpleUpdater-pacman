#!/bin/bash

arch_upgrade_Script_cript_version="V1.1.0-beta"


show_options() {
    echo "1) Update, Upgrade & exit."
    echo ""

    echo "2) Update, Upgrade & SOFT/HARDS-Rebooting the System."
    echo "3) Update, Upgrade & Hardware-Rebooting the System."
    echo ""

    echo "4) Update,Upgrade & Shutting down the System."
    echo ""
    #TODO echo "?) Update, Upgrade, SOFT-Rebooting & Sleep the System "

    echo "u) Reboot to UEFI/BIOS, no Update."
    echo "0) Exit. ᗜ˰ᗜ"
}

update_and_upgrade_system() {

    # Fetches the latest versions of your package-lists
    # Downloading and installing the updates for each outdated package and dependency on your system
    # Syyu: the second y is for making sure the mirrors are "force syncedS"
    sudo pacman -Syyu --noconfirm
    echo "System upgraded!"
    sleep 0.5

    # Clean up pacman
    pacman_orphans="$(pacman -Qdtq)"
    if [ -n "$pacman_orphans" ]; then
      sudo pacman -Rns $pacman_orphans  --noconfirm
    else
      echo "No pacman orphans"
    fi

    sudo pacman -Sc --noconfirm
    echo "pacman cleaned!"
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

update_upgrade_and_hard_or_soft_reboot_system(){
    #checking for kernal updates for every major Arch-Kernel version (defualt, zen, lts, linux-hardened)
    # 2>/dev/null silences the error message, keeping the output empty
    is_kernel_update_available=$(pacman -Qu linux linux-zen linux-lts linux-hardened linux‑cachyos linux-xanmod linux-manjaro 2>/dev/null)


    if [[ -z "$is_kernel_update_available" ]]; then

        # Kernal Update available, set case to 0
        kernal_update_status="0"
        echo "No hard reboot needed!"
        echo "Kernel up‑to‑date! ᗜˬᗜ"
    else

        # Kernal Update available, set case to 1
        kernal_update_status="1"
        echo "Hard Reboot Needed"
        echo "New Kernel update available! ᗜ˰ᗜ"
        echo "$is_kernel_update_available"
    fi

    # Update Upgrade and clen up
    update_and_upgrade_system

    # selects which reboot needs to be done via case switch
    case $kernal_update_status in

        0)

            # SOFT-Rebooting now!
            echo "System Upgraded, SOFT-Rebooting now!"
            sleep 3
            sudo systemctl soft-reboot
            break
            ;;
        1)
            # HARD-Rebooting now
            echo "System Upgraded, HARD-Rebooting now!"
            sleep 3
            sudo reboot now
            ;;

   esac
}

update_upgrade_and_hardware_reboot_system(){

    # Update Upgrade and clen up
    update_and_upgrade_system

    # Rebooting now
    echo "System Upgraded, Rebooting now!"
    sleep 3
    sudo reboot now
}

reboot_to_UEFIorBIOS(){

    clear
    echo "No Updates and/or Upgrades were made. System remains unchanged!"
    echo "-- Reboot to UEFI/BIOS --"
    echo ""
    echo "ᗜ˰ᗜ"

    # Rebooting to UEFI/BIOS if supported!
    sudo systemctl reboot  --firmware-setup
}

#TODO Something that Hibernates the PC after a hard or soft Reboot !!!

# Start of the Script with formating
clear
echo "---> Simple-Linux-Upgrade-Script-pacman $arch_upgrade_Script_cript_version <---"
echo ""
echo $(date)
echo ""
show_options
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
            update_upgrade_and_hard_or_soft_reboot_system
            break
            ;;

        3)

            update_upgrade_and_hardware_reboot_system
            break
            ;;

        4)
            update_upgrade_and_shutdown_system
            break
            ;;

        0)
            clear
            echo "No Updates and/or Upgrades were made. System remains unchanged!"
            echo "Update-Script clossing!..."
            echo "Untill next time."
            echo ""
            echo "ᗜ˰ᗜ"
            break
            ;;

        u)
            reboot_to_UEFIorBIOS
            break
            ;;

        *)
            clear
            echo "---> Simple-Linux-Upgrade-Script-pacman $arch_upgrade_Script_cript_version <---"
            echo ""
            echo "!WARNING! '$choice' is a invalid option! !WARNING!"
            echo ""
            show_options
            echo ""
            read -p "Choose an option: " choice
            ;;
    esac
done
