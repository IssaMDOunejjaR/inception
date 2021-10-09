#! /bin/sh

# Download Virtualbox
# echo "✅ Checking if there is an Virtualbox ..."
# which virtualbox &> /dev/null
# if [ $? -nq 0 ]; then
# 	echo "❌ Virtualbox is not installed in your machine !"
# 	echo -n "Do you want to donwload it ? (y/n): "
# 	read INPUT
# 	if [ "$INPUT" = "y" ]; then
# 		echo "📥 Downloading the image ..."
# 		wget -q https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb -O virtualbox.deb &
# 		wait $!
# 		echo "✅ Virtualbox is finished downloading !"
# 		echo "Installing virtualbox ..."
# 		sudo apt install ./virtualbox.deb &> /dev/null
# 		echo "✅ Virtualbox is finished installing !"
# 	fi
# else
# 	echo "✅ Virtualbox found !"
# fi

# Download ubuntu.iso
sleep 2
echo "✅ Checking if there is an ubuntu image ..."
# sleep 2
if [ ! -f ./ubuntu.iso ]; then
	echo "❌ We didn't find any ubuntu image !"
	echo -n "Do you want to donwload it ? (y/n): "
	read INPUT
	if [ "$INPUT" = "y" ]; then
		echo "📥 Downloading the image ..."
		wget -q https://github.com/IssaMDOunejjaR/ft_services -O ubuntu.iso &
    	# wget -q https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso -O ubuntu.iso &
		wait $!
		echo "✅ Ubuntu image is finished downloading !"
	else
		echo "Canceling the virtual machine setup."
		exit 1
	fi
else
	echo "✅ Ubuntu image found !"
fi

# Create VM
echo "Creating the virtual mchine ..."
read -p "name: " MACHINENAME
VBoxManage createvm --name $MACHINENAME --ostype "Debian_64" --register --basefolder `pwd`
# #Set memory and network
# VBoxManage modifyvm $MACHINENAME --ioapic on
# VBoxManage modifyvm $MACHINENAME --memory 1024 --vram 128
# VBoxManage modifyvm $MACHINENAME --nic1 nat
# #Create Disk and connect Debian Iso
# VBoxManage createhd --filename `pwd`/$MACHINENAME/$MACHINENAME_DISK.vdi --size 80000 --format VDI
# VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
# VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  `pwd`/$MACHINENAME/$MACHINENAME_DISK.vdi
# VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
# VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium `pwd`/debian.iso
# VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

# #Enable RDP
# VBoxManage modifyvm $MACHINENAME --vrde on
# VBoxManage modifyvm $MACHINENAME --vrdemulticon on --vrdeport 10001

# #Start the VM
# VBoxHeadless --startvm $MACHINENAME