@echo off
for /F "tokens=* USEBACKQ" %%g in (`catkin_find jackal_firmware_ms firmware\mcu.bin`) do (SET bin_file=%%g)

rem this is done here because the hosted dfu-util package has not been updated to with the checksum
choco install dfu-util -y --allow-empty-checksums

rem doing this here as well so that it doesn't need to resovle through rosdep
choco install zadig -y

echo If you have not already done so, please put the hardware into firmware update mode. 
pause


echo In order to update the firmware, A User interface utility called ZaDig will be launched.
echo Since it does not have a command line interface, please select 'Replace Driver'.
pause

rem pushing the current path so zadig can find the ini file
pushd %~dp0
zadig
popd 

echo Please continue after Zadig exits
pause

echo "Uploading file: %BIN_FILE%"
dfu-util -v -d 0483:df11 -a 0 -s 0x08000000 -D %BIN_FILE%

echo Please shutdown Windows, then flip the bootloader switch and restart. 
