#!/bin/bash
TOUCHPAD_ID=$(xinput list | grep Touchpad | head | sed -e 's/^.*id=//' -e 's/\s.*$//')
xinput set-prop ${TOUCHPAD_ID} 'libinput Natural Scrolling Enabled' 1 2> /dev/null
if [ $? == 0 ]; then
    echo "Enabled for $(xinput list --name-only $pointer)"
fi
