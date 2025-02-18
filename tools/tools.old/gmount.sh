#!/bin/bash

apt-get install guestmount

mkdir -p /media/$1

guestmount -a $1 -m /dev/sda1 /media/$1 

echo TASTE druecken um wieder zu ent-mounten
read

umount /media/$1

echo ls /media/$1
ls /media/$1

read

#rmdir /media/$1
echo rmdir /media/$1 selber schauen von hand lueoschen 


