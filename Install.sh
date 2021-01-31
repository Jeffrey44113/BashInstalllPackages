#!/bin/bash -x

#Everything installed: sudo apt list --installed |awk -F/ '{print $1}' 


InstallState=0 
LSB_Release=$(lsb_release -si)
Nassie='jplacenassie.local'


#Something for in the future
ServerOrClient=0


UpdateAndUpgrade()
{
    sudo apt update && sudo apt upgrade 
}

NassieCheckAndGettingInfo()
{
    ping -c 3 $Nassie > /dev/null 2>&1
        if [ $? -eq 3 ]
        then 
            echo "Using Nas instead of Git"
        else 
            echo "Nas cannot be reached so will use Git instead"
        fi 
}


    if [ $LSB_Release == "Pop" ]; then
    #UpdateAndUpgrade

    elif [ $LSB_Release == "Ubuntu" ]; then
        echo "Ubuntu"  
        UpdateAndUpgrade
    
    else
        echo "Not supported OS "
    fi
