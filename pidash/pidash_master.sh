#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "Sorry, this script must be run with sudo."
	exit 1
fi

read -p 'Are you sure you want to continue? (y/n) ' -n 1 confirmation
 echo ''                                                                                                   
 if [[ $confirmation != 'y' && $confirmation != 'Y' ]]; then                                               
   exit 3                                                                                                
 fi
 # Code to execute if user wants to continue here.
#change password, expand file system



#PREREQUISTE SETUP OF PI
#intro
echo "---This script will setup the pi to be a dashcam---"

#initial update

#disable ipv6
echo "Disabling ipv6..."
sleep 2
chmod +x disable_ipv6.sh
sh ./disable_ipv6.sh

echo "---pi will now update/upgrade---"
sleep 2
echo "Updating..."
chmod +x update.sh
sh ./update.sh
echo "---Update/Upgrade Complete---"
sleep 2

#set timezone
echo "Setting timezone to EDT..."
sleep 2
chmod +x set_timezone.sh
sh ./set_timezone.sh

#install git
echo "Installing Git..."
sleep 2
chmod +x install_git.sh
sh ./install_git.sh

#install dbusx11
echo "Installing Dbusx11..."
sleep 2
chmod +x install_dbusx11.sh
sh ./install_dbusx11.sh

#install upstart
echo "Installing Upstart..."
sleep 2
chmod +x install_upstart.sh
sh ./install_upstart.sh

#install inotify
echo "Installing inotify..."
sleep 2
chmod +x install_inotify.sh
sh ./install_inotify.sh

#Create persistant directory and move scritps
echo "Creating /usr/share/pidash and moving scripts..."
sleep 2
chmod +x create_directory.sh
sh ./create_directory.sh

#GPS
echo "Installing GPSD and dependencies..."
sleep 2
chmod +x install_gpsd.sh
sh ./install_gpsd.sh

#enable Uart
echo "enabling UART..."
chmod +x enable_uart.sh
sh ./enable_uart.sh

#echo "Passing correct socket to GPSD..."
#sleep 2
#sh /usr/share/pidash/gpsd_socket.sh


#CONFIGURE STORAGE
#getting flash drive to always mount
echo "Installing Pmount..."
sleep 2
chmod +x install_pmount.sh
sh ./install_pmount.sh

#create automount
echo "Generating automounting script..."
sleep 2
chmod +x automount.sh
sh ./automount.sh
#broken
echo "Generating autostorage script..."
sleep 2
chmod +x auto_storage.sh
sh ./auto_storage.sh

#Create folders if not already there
echo "Creating folders on storage device..."
sleep 2
chmod +x create_storage_script.sh
sh ./create_storage_script.sh



#CONFIGURE RECORDING
#INSTALL BONECV
echo "Installing boneCV..."
sleep 2
chmod +x install_bonecv.sh
sh ./install_bonecv.sh

#INSTALL FFMPEG
echo "Installing ffmpeg..."
sleep 2
chmod +x install_ffmpeg.sh
sh ./install_ffmpeg.sh

#SET DEFAULT CAMERA PARAMETERS IN V4L2
echo "Configuring camera parameters..."
sleep 2
chmod +x config_v4l2.sh
sh ./config_v4l2.sh


#CREATE SYSTEM SERVICES

#CREATE RECORDING WATCH SYSTEM SERVICE TO MONITOR IF RECORDING AND CONTROL LED
echo "Creating rec_watch system service..."
sleep 2
chmod +x create_rec_watch_service.sh
sh ./create_rec_watch_service.sh

#CREATE CAPTURE SYSTEM SERVICE
echo "Creating capture system service..."
sleep 2
chmod +x create_capture_service.sh
sh ./create_capture_service.sh

#CREATE GPSLOG SYSTEM SERVICE
echo "Creating gpslog system service..."
sleep 2
chmod +x create_gpslog_service.sh
sh ./create_gpslog_service.sh

#CREATE MOVE SYSTEM SERVICE
echo "Creating video move system service..."
sleep 2
chmod +x create_move_service.sh
sh ./create_move_service.sh

#CREATE DELETE WHEN FULL SERVICE
echo "Creating delete when full system service..."
sleep 2
chmod +x create_del_full_service.sh
sh ./create_del_full_service.sh

#CREATE BATCH CONVERT ALIAS
echo "Creating batch convert alias..."
sleep 2
chmod +x create_batch_convert_alias.sh
sh ./create_batch_convert_alias.sh





#EVERYTHING BELOW HERE IS DISABLED
if false
then













#SETUP OBD DATA LOGGING




#CONFIGURE ACCELEROMETER



#allowing server connection for viewing






fi