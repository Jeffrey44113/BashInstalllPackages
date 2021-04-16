#!/bin/bash 

#Everything installed: sudo apt list --installed |awk -F/ '{print $1}' 


InstallState=0 
LSB_Release=$(lsb_release -si)
Nassie='jplacenassie.local'

Google='google.com'

#Something for in the future
ServerOrClient=0


UpdateAndUpgrade()
{
    sudo apt update && sudo apt upgrade 
}

NassieCheckAndGettingFile()
{
    ping -c 3 $Nassie > /dev/null 2>&1
        if [ $? -eq 3 ];then 

            echo "Using Nas instead of Git"

            if [ $Release == 1 ]; then
                 wget $Nassie/DataJeff/List.txt

            elif [ $Release == 2 ]; then
                 wget $Nassie/DataJeff/List.txt

            elif [ $Release == 3 ]; then
                wget $Nassie/DataJeff/ListPi.txt

            else
                 #Default is List 
                 wget $Nassie/DataJeff/List.txt
            fi
            
            

        else

            echo "Nas cannot be reached so will use Git instead"

            if [ $Release == 1 ]; then
                 wget https://raw.githubusercontent.com/Jeffrey44113/BashInstalllPackages/Testerbranch/List.txt 

            elif [ $Release == 2 ]; then
                 wget https://raw.githubusercontent.com/Jeffrey44113/BashInstalllPackages/Testerbranch/List.txt 

            elif [ $Release == 3 ]; then
                wget https://raw.githubusercontent.com/Jeffrey44113/BashInstalllPackages/Testerbranch/ListPi.txt 

            else
                 #Default is List 
                wget https://raw.githubusercontent.com/Jeffrey44113/BashInstalllPackages/Testerbranch/List.txt 
            fi
            #testing branch list
            #wget https://raw.githubusercontent.com/Jeffrey44113/BashInstalllPackages/Testerbranch/List.txt 
        fi 
}


    if [ $LSB_Release == "Pop" ]; then

        #setting Release variable and checking on that in the NassieCheck Function 
        Release=1

        #UpdateAndUpgrade
        NassieCheckAndGettingFile

        #install with the list included and got from git or nas
        xargs -a List.txt sudo apt install -y

        
    elif [ $LSB_Release == "Ubuntu" ]; then
        
        Release=2

        UpdateAndUpgrade
        NassieCheckAndGettingFile

    elif [[ $LSB_Release == "Raspbian" ]]; then

        Release=3

        echo "Raspbian"
        
        UpdateAndUpgrade
        NassieCheckAndGettingFile

        #Using Xargs since that should be possible, lets test. 
        xargs -a ListPi.txt sudo apt install -y 

    else
        echo "Not supported OS "
         ping -c 3 $Nassie > /dev/null 2>&1
         if [ $? -eq 3 ];then 
            echo "All good"
         fi 
    fi
