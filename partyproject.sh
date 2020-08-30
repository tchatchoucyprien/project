#!/bin/bash
#Author: Cyprien
#Date: August 2020
#Description: This file tests the case command
#Event: Party

        echo "How old are you?"
        read AGE

if [ $AGE -gt 85 ]
    then
        echo "Please follow the senior table"
        exit

else
        echo "Which country are you from?"
        read CNT


        case ${CNT^^} in
                   CAMEROON | NIGERIA | TOGO | LIBERIA | GHANA | KENYA )
                if [ $AGE -lt 21 ] ; then
                        echo " Please follow $CNT table 1 direction"
                else
                        echo " Please follow $CNT table 2 direction"
                fi
            ;;
            *)
                        echo "Sorry, you don't belong to the invited countries"
            ;;
        esac
fi
