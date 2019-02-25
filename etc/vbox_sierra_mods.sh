#!/bin/bash
set -euxo pipefail

VBOX_NAME="${VBOX_NAME:-amelia-high-sierra-base}"

#VBoxManage modifyvm     "$VBOX_NAME"  --cpuidset 00000001 000306a9 00020800 80000201 178bfbff
#VBoxManage modifyvm     "$VBOX_NAME"  --vram 256
#VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
#VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
#VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
#VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
#VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
#VBoxManage setextradata "$VBOX_NAME" "VBoxInternal2/EfiGraphicsResolution" "1920x1080"

VBoxManage modifyvm     "$VBOX_NAME"  --cpuidset 00000001 000306a9 00020800 80000201 178bfbff
VBoxManage modifyvm     "$VBOX_NAME"  --vram 256
VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-2BD1B31983FE1663"
VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "$VBOX_NAME" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
VBoxManage setextradata "$VBOX_NAME" "VBoxInternal2/EfiGraphicsResolution" "1920x1080"
