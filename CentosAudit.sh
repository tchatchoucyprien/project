#!/bin/bash
#Description: Project 11
#Author: Cyprien
#Date: August 2020


echo -e "\n***************************************************\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n************** Centos 7 audit *******************\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n+++++++++++++++++++++++++++++++++++++++++++++\n" >> /var/log/centos7audit-$(date +%F)

echo -e "\n Check the hosts file" >> /var/log/centos7audit-$(date +%F)
if [ -f /etc/hosts ] ; then
        echo "\nFile /etc/hosts exists in our server\n" >> /var/log/centos7audit-$(date +%F)
else
        echo "\nFile /etc/hosts does not exist\n" >> /var/log/centos7audit-$(date +%F)
fi

# Check SELinux

echo -e "\nChecking the SELinux\n" >> /var/log/centos7audit-$(date +%F)

echo -e "\nThe SELinux is set to $(getenforce) \n" >> /var/log/centos7audit-$(date +%F)

#awk ' /^SELINUX=/{print $0}' /etc/sysconfig/selinux |awk -F"=" '{print $2}'
#cat /etc/selinux/config |grep ^SELINUX= |awk -F"=" '{print $2}'


# check what is the uid of the user nobody
echo -e "\nChecking nobody's user uid  " >> /var/log/centos7audit-$(date +%F)


#echo -e "The user nobody's uid is $(grep ^nobody /etc/passwd |awk -F '{print$3}') >> /var/log/centos7audit-$(date +%F)">> /var/log/centos7audit-$(date +%F)
echo -e "\nNobody's id is $(id -u nobody) \n" >> /var/log/centos7audit-$(date +%F)


# check if the package samba is installed on the system

echo -e "\nChecking samba package\n" >> /var/log/centos7audit-$(date +%F) >> /var/log/centos7audit-$(date +%F)

rpm -qa |grep samba > /dev/null 2>&1

if [ $? -eq 0 ] ;then
                echo -e  "\npackage samba is installed\n" >> /var/log/centos7audit-$(date +%F)

        else
                echo -e "\nThe package samba is not installed\n" >> /var/log/centos7audit-$(date +%F)

        fi
#check if the auditd daemmon is running and is enabled

echo -e "\nChecking the auditd\n" >> /var/log/centos7audit-$(date +%F)

systemctl status auditd | awk 'NR ==3 {print "auditd is " $3}' | tr -d '()' >> /var/log/centos7audit-$(date +%F)

systemctl status auditd | awk 'NR ==3 {print "auditd is " $3}' | tr -d '()' >> /var/log/centos7audit-$(date +%F)

#echo "the auditd daemon is `systemctl is-active auditd` and `systemctl is-enabled auditd`"

# check if the sudo tool has any logfile configured

#check if the /etc/group file is own by root user


#check if the curl command is installed

echo -e "\nChecking curl package\n" >> /var/log/centos7audit-$(date +%F) >> /var/log/centos7audit-$(date +%F)

rpm -qa |grep curl > /dev/null 2>&1

        if [ $? -eq 0 ] ;then
                echo -e  "\npackage curl is installed\n">> /var/log/centos7audit-$(date +%F)

        else
                echo -e "\nThe package curl is not installed\n">> /var/log/centos7audit-$(date +%F)

        fi


#check if docker is installed
echo -e "\nChecking docker package\n" >> /var/log/centos7audit-$(date +%F) >> /var/log/centos7audit-$(date +%F)

rpm -qa |grep docker > /dev/null 2>&1

if [ $? -eq 0 ] ;then
                echo -e  "\npackage docker is installed\n">> /var/log/centos7audit-$(date +%F)

        else
                echo -e "\nThe package docker is not installed\n">> /var/log/centos7audit-$(date +%F)

        fi


#check what is the total size of the memory

#check what is the first digit of the kernel version

echo -e "\nCheck if the system is 64 bits or 32 bits\n" >> /var/log/centos7audit-$(date +%F)


echo -e "\nThe system is $(getconf LONG_BIT) bits\n" >> /var/log/centos7audit-$(date +%F)


#check if the /etc/sysconfig/network file exist.

echo -e "\nCheck the /etc/sysconfig/network file\n" >> /var/log/centos7audit-$(date +%F)
if [ -f /etc/sysconfig/network ] ; then
        echo -e "\nFile /etc/sysconfig/network exists in our server\n" >> /var/log/centos7audit-$(date +%F)
else
        echo -e "\nFile /etc/sysconfig/network does not exist\n" >> /var/log/centos7audit-$(date +%F)
fi


#check if there is a dns entry in the /etc/resolv.conf file with 8.8.8.8

#check what is the ip address of the server.

#check what linux flavor is running and the version.

#check what is the hostname.
echo -e "\nChecking the hostname of our server\n" >> /var/log/centos7audit-$(date +%F)

echo -e "\nThe hostname of this server is $(hostname) \n"  >> /var/log/centos7audit-$(date +%F)


