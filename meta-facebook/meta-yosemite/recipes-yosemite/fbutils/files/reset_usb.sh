#!/bin/sh
#
# Copyright 2014-present Facebook. All Rights Reserved.
#
# This program file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program in a file named COPYING; if not, write to the
# Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301 USA
#

. /usr/local/fbpackages/utils/ast-functions

#TODO: Add logic to control mux based on front panel switch
echo -n "Set USB Mux to given slot ... "

# USB_MUX_SEL signals: GPIOE4(36), GPIOE5(37)
slot=$1

case $slot in
  1)
    gpio_set E4 1
    gpio_set E5 0
    ;;
  2)
    gpio_set E4 0
    gpio_set E5 0
    ;;
  3)
    gpio_set E4 1
    gpio_set E5 1
    ;;
  4)
    gpio_set E4 0
    gpio_set E5 1
    ;;
  *)
    gpio_set E4 0
    gpio_set E5 0
    ;;
esac

# Enable the USB MUX GPIOS3(147)
gpio_set S3 0

echo "Done"
