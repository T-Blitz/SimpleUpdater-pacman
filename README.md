# SimpleUpdater-pacman
 A Simple script that helps you with keeping your pacman based Linux Up to date. Includes Flatpacks as well.

 
 # Simple-Linux-Upgrade-Scripts
### Doing what Windows is struckling with

Make sure you are using pacman and not apt, npm, etc!
Download the Repo in anyway, and make sure to extract as folder.
Copy/Move the "SimpleUpdater-pacman" folder to your root/opt/ folder. opt has been chhose since it's a write protected folder.
Make sure the main .sh script is markt as executable.
Copy the .Desktop file to your Desktop and mark it as executable.

Mark the script as executable and remove write permissions:


```
sudo cp SimpleUpdater-pacman /opt/
cd /opt/SimpleUpdater-pacman
sudo chmod u-w,u+x Simple-Linux-Upgrade-Script-pacman.sh
sudo chmod u-w,u+x SimpleUpdater.desktop
sudo cp -a SimpleUpdater.desktop /home/$USER/Desktop/

```
Run the "SimpleUpdater.desktop" file, each time you wish to Upgrade your System and or want to Reboot/Shutdown or even reboot to UEFI/BIOS.

My recommendations is to always Update and Soft/Hard-Reboot your system at the start of your session.
If you use your PC often, don't shut it down, but select "Sleep". This will make sure your Hardware is not "shocked" awake every day.
Sleep keeps the RAM also on. Not dumping everything to your swap. 

*Custom "SimpleUpdater.desktop"(pacman version) file loge made by me, using stock images and Gimp. (WITHOUT AI!)
