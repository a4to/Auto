# Automate BootStrapping Scripts

Auto, is a tool providing users with simple and easy way to bootstrap and install Arch Linux.

During the installation process, you will be given the option to install either bare Arch Linux, and make all further installations decisions 
yourself, or to choose from a selection of one of the supported bare, or pre-configured desktop environment and window managers. 
The flagship of AutoLinux being the DWM edition. 



## Currently Supported Editions:

* DWM - AutoLinux Edition
* Plasma - AutoLinux Edition
* Plasma (KDE Plasma as it comes)
* Gnome (Gnome as it comes)
* Xfce (Xfce as it comes)
* Bare ArchLinux (No Additional Packages)  



## Usage:

The package consists of 3 scripts:

+ `autoPart`: A partitioning script.
+ `autoInstall`: The base install script.
+ `autoCleanInstall`: The clean install script.


**autoInstall**: This script is to be used for installing AutoLinux ontop of an existing Arch Linux installation, as a new user profile.


**autoCleanInstall**: This script is intended for use when performing a clean/fresh installation, with no pre-existing OS installed on the partition(s) reserved for AutoLinux. 
This script also includes section for partitioning your drive, so running the autoPart script is *NOT* required.


**autoPart**: This script is for useage outside of the AutoLinux installation process, and serves simply as a helper when partitioning your drive for any fresh installation.

*NOTE*: The options are limited to partition selection, or drive wipe. 
As for creating new partitions and deleting existing partitions, an external program such as cfdisk, fdisk or parted will be required if necessary.
The script also does not allow for manual selection of a file system type, and the rootfs is automatially set to ext4.


Upon installation, please read the function of both the `autoInstall` and `autoCleanInstall` script, and select *EITHER* `autoInstall` or `autoCleanInstall` to carry out 
the installation process. The `autoCleanInstall` script calls the `autoInstall` script upon completion of the base installation, so running both scripts is *NOT* required. 
  


**Prerequisites**

* The script takes care of all requirements dependencies do not have to be manually installed. ✔



I hope you find these scripts helpfull !      - a4to

