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

NassieCheckAndGettingFile()
{
    ping -c 3 $Nassie > /dev/null 2>&1
        if [ $? -eq 3 ]
        then 
            echo "Using Nas instead of Git"
            wget $Nassie/DataJeff/List.txt
        else 
            echo "Nas cannot be reached so will use Git instead"
            #testing branch list
            wget https://raw.githubusercontent.com/Jeffrey44113/BashInstalllPackages/Testerbranch/List.txt 
        fi 
}


    if [ $LSB_Release == "Pop" ]; then
    #UpdateAndUpgrade
    NassieCheckAndGettingFile

    #install with the list included and got from git or nas
    xargs -a List.txt sudo apt install -y

    
    elif [ $LSB_Release == "Ubuntu" ]; then
        echo "Ubuntu"  
        UpdateAndUpgrade

        NassieCheckAndGettingFile


    else
        echo "Not supported OS "
    fi
