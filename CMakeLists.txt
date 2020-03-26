cmake_minimum_required(VERSION 2.8.3)
project(jackal_firmware_ms)

find_package(catkin)

catkin_package()

install(DIRECTORY firmware
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

install(PROGRAMS scripts/upload.bat scripts/zadig.ini
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
