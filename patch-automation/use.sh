#!/bin/bash

for user in govadmin
do

# Create user account
/usr/sbin/useradd -s /bin/bash -m $user

# Generate SSH key for user
mkdir /home/$user/.ssh/
cd /home/$user/.ssh/
echo  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBG8bP5QPgb6GkUOxib4r5nufXBjHpC0bQr3Pg5fX4YWzRzSb0Idu7WSOIdEWJPWR7YUcsJ7lRQgGVEsi3rv2QNAbWyy4s53NKykUZG1J0AuIbBvzfBvsyCH19JH4RdHwBifv6m11NHiA3L2ZNSU6ujvUwvx2d7UX5bOIbg6d1eR70I0Xd5wyu2KNy7MP9p8IlM/DVOsXj7N/pvuE8PGqMkKAxUsi0lxQQG2Rf/txk/WADbrOC9mSXvvU2htIJXouhrnSHaxO2bbPr1bkZfxHJV00WRHxL/6q6IxKttKBx24g6jF/2TiqTPhCyajbpIj/pLnLGn1jKkEMVqB6rUYDVThbxSb6L074ZV3ivxwWgCFek+5Wkiqwa2BVDeXswKB72YVsdzSwNvIPCafsMbXuLJ1Kk8ALT94MPIDDkD0Rr64+OIWzRmNC5AHevs0M1aBDVf1uPxJERlbOosDpRezuO/kVcLWl1hj08zzB3IT7opAxv/744gV5/KlhJ4YcCykVSPhKzDb92AH1PDHu2f9Jqmws95R/Mjy3FE2bdqWDiCzULpev6yKkT8ccGnLaJLMLFEreAf7hJ2sZE+qXy2Ap40/RFzG7Z7ICctKIFSYnUrKNlV8qKC7I5PhpQUrT/aDibxhhP2gZO7B7WKqfS231ESHFQkxyj0kLCr5heeVwL8Q== root@19df93e549cc" >> authorized_keys
echo "govadmin  ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

done

