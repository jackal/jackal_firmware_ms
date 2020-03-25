@echo off
for /F "tokens=* USEBACKQ" %%g in (`catkin_find jackal_firmware_ms firmware\mcu.bin`) do (SET bin_file=%%g)

echo In order to update the firmware, A User interface utility called ZaDig will be launched.
echo Since it does not have a command line interface, please select *Replace Driver*
pause
zadig

echo Continue once Zadig exits
pause

echo "Uploading file: %BIN_FILE%"
dfu-util -v -d 0483:df11 -a 0 -s 0x08000000 -D %BIN_FILE%