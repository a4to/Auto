# AutomateOS BootStrapping Scripts

AutoLinux, is a tool providing the user with  simple and easy way to bootstrap and install ArchLinux.

During the installation process, you will be given the option to install either bare ArchLinux, and make all further installations yourself,
or to choose from a selection of the AutoLinux pre-configured desktop environment and window managers profiles, the flagship being the DWM edition. 




## Usage:

The package consists of 3 scripts:

+ `autoPart`: A partitioning script.
+ `autoInstall`: The base install script.
+ `autoCleanInstall`: The clean install script.



**autoInstall**: This script is to be used for installing AutoLinux ontop of an existing Arch Linux installation, as a new user profile.


**autoCleanInstall**: This script is intended for use when performing a clean/fresh installation, with no pre-existing OS installed on the partition(s) reserved for AutoLinux. 
This script also includes section for partitioning your drive, so running the autoPart script is *NOT* required.


**autoPart**: This script is for use outside of the AutoLinux installation process, and serves simply as a helper when partitioning your drive for any fresh installation.

*NOTE*: The options are limited to partition selection, or drive wipe. 
As for creating new partitions and deleting existing partitions, an external program such as cfdisk, fdisk or parted is required.
The script also does not allow manual selection of FS type, and rootfs is automatially set to ext4.



Upon installation, please read the function of both these scripts, and select *EITHER* `autoInstall` or `autoCleanInstall` to carry out the installation process.
The `autoCleanInstall` script calls the `autoInstall` script upon completion of the base installation, and running both scripts is not required. 




**Prerequisites**

- The script takes care of all requirements dependencies do not have to be manually installed. ✔




I hope these scripts are helpful and you enjoy your time in AutoLinux!     - a4to

