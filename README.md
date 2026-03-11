# SimpleUpdater-pacman
### Doing what Windows is struckling with
A Simple script that helps you with keeping your pacman based Linux Up to date. <ins>Includes Flatpacks as well.</ins>

 
## Installation


Make sure you are using pacman and not apt, npm, etc!<br/>
<br/>
Clone the Repo:
```
 git clone https://github.com/T-Blitz/SimpleUpdater-pacman.git
```

Move the "SimpleUpdater-pacman" folder to your /opt/ folder:<br/> 
("/opt/" has been chosen because it's a write protected folder.)<br/>
```
sudo mv SimpleUpdater-pacman /opt/
```
Change directory to the SimpleUpdater-pacman folder in /opt/:<br/>
```
cd /opt/SimpleUpdater-pacman
```
Make sure "Simple-Linux-Upgrade-Script-pacman.sh" is markt as executable and has no write permissions:<br/>
```
sudo chmod u-w,u+x Simple-Linux-Upgrade-Script-pacman.sh
```

Copy the "SimpleUpdater.desktop" file to your Desktop:<br/>

```
sudo cp -a SimpleUpdater.desktop /home/$USER/Desktop/
```

Change directory to your Desktop:<br/>

```
cd /home/$USER/Desktop/
```
Mark "SimpleUpdater.desktop" as executable and remove write permissions:<br/>

```
sudo chmod u-w,u+x SimpleUpdater.desktop
```
<br/>
Run the "SimpleUpdater.desktop" each time you wish to upgrade your system or even just to reboot to UEFI/BIOS.


My recommendations is to always Update and Soft/Hard-Reboot your system at the start of your session.<br/>
If you use your PC often, don't shut it down, but select "Sleep".<br/>
This will make sure your Hardware is not "shocked" awake every day.<br/>
Sleep keeps the RAM also on. Not dumping everything to your swap.<br/>

_*Custom "SimpleUpdater.desktop"(pacman version) file loge made by me, using stock images and Gimp. (WITHOUT AI!)_
