#!/bin/bash

#Building a script that compile SCSS for unity builds
#Author: Fabio Paniconi 30.05.2017
#Version: 2.0.0
#Revision: 22.06.2017
# To run the script just type "./build.sh" in a bash terminal on visual studio code, just make sure you are in the main unity folder (Ex: C:\gitrepos\sd-unity>) or whatever is your folder.

#Create array from json file build-config.json, this file need to be in the same directory as build.sh

readarray -t buildName < <(grep '"' build-config.json | cut -d '"' -f4)

echo ${buildName[-1]}

#Dispaly all the value in the array
#echo ${buildName[@]}

#Display array length
#echo ${#buildName[@]}

#Define path to file
# If you want to automate your main css as well you need to point to the right folder.
# ${buildName[-1]} get the last element in the array so make sure this value is always last one in your build-config.json.

SPTH=${buildName[-1]}

#Declare colors, this only work with printf method not echo

RED='\033[0;31m'

# No Color

NC='\033[0m'
GREEN=`tput setaf 2`

#Declare a variable choice and assing a value

choice=4

#Function that print app menu to console

print_menu () {
  printf "\n${GREEN}1. Compile SASS with ruby\n\n"
  printf "2. Build list\n\n"
  printf "3. Exit${NC}\n\n"
  echo -n 'Please, choose an option, 1,2 or 3: '
}

# Displaying the menu as the app start

print_menu

#Loop while the variable choice is equal to 4
#bash while loop

 while [ $choice -eq 4 ]; do

     #read user input

     read choice

     #bash nested if/else

     if [ $choice -eq 1 ] ; then

     echo ""
     read -p 'Please, enter a build name: ' setBrand

     if [[ " ${buildName[@]} " =~ " ${setBrand} " ]]; then

         # whatever you want to do when arr contains value

         #Set a build command

         buildBrand="sass --watch --compass sass/skins/$setBrand/:css/skins/$setBrand/"

         printf "\n$setBrand found...\n\n"
         printf "${GREEN}Rewrite @import in main.css with $setBrand, path: $SPTH ${NC}\n\n"

         #Override the main.css
         echo "@import url(\"../css/skins/$setBrand/$setBrand.css\");" >${SPTH}/main.css

         #Evaluate the sass build command in the console
         eval $buildBrand

     fi

     if [[ ! " ${buildName[@]} " =~ " ${setBrand} " ]]; then

         # whatever you want to do when arr doesn't contain value

         echo ""
         printf "${RED}$setBrand is an unnknown skin${NC}\n\n"
         print_menu
         choice=4

     fi
     #
     else

     if [ $choice -eq 2 ] ; then
         printf "\n${GREEN}Number of skin:${NC} ${#buildName[@]}\n"
         printf "\n${GREEN}Available build name:${NC}\n\n"
         printf '%s\n' "${buildName[@]}"
         echo ""
         read -n 1 -s -p "Press any key to continue..."
         echo ""
         print_menu
         choice=4

     else

         if [ $choice -eq 3 ] ; then

            echo "Now leaving build script.."
            exit 1

         else

             printf "\n"
             printf "${RED}You typed a wrong value. Please, choose between 1-3!${NC}\n\n"
             print_menu
             choice=4

         fi
     fi
     #
   #End while loop
   fi
 done