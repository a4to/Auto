#!/bin/sh
#########################################################################################################################################################################################
##                                                                A U T O L I N U X    B O O T S T R A P    S C R I P T                                                                ##
#########################################################################################################################################################################################

#                                                         _               _               _       __                         _  _                                                      # 
#                                                        /.\     _    _  FJ_     ____    FJ      / J   _ _   _    _    _    FJ  LJ                                                     # 
#                                                       //_\\   J |  | LJ  _|   F __ J  J |      LFJ  J ' \  J   J |  | L   J \/ F                                                     # 
#                                                      / ___ \  | |  | || |-'  | |--| | | |      J  L | |\\   |  | |  | |   /    \                                                     # 
#                                                     / L___J \ F L__J JF |__-.F L__J J F L_____ J  L F L \  JJ  F L__J J  /  /\  \                                                    # 
#                                                    J__L   J__J\____,__\_____J\______/J________LJ__LJ__L \\J__LJ\____,__LJ__//\\__L                                                   # 
#                                                    |__L   J__|J____,__J_____FJ______F|________||__||__L   J__| J____,__F|__/  \__|                                                   # 

#########################################################################################################################################################################################
#########################################################################################################################################################################################

drives(){

## If you would like to include any additional drives or partitions
## in the file system table, please use the 'mkmnt' command, followed 
## by a name for the folder in which you would like it to be mounted, 
## followed by the name of partition ( NOT THE FULL PATH ). The 3 words 
## should be seperated by a single space in between them. 

## For example: ' mkmnt newFolderName partition/driveName '
##            : '       mkmnt    myFolder    sda1         '

# mkmnt 
# mkmnt 
# mkmnt 

## If you have any extra swap partitions you would like to turn on,
## insert them below, following '/dev/' for every line below..

# swapon /dev/
# swapon /dev/          
# swapon /dev/          


genfstab -U /mnt > /mnt/etc/fstab ; } 

#########################################################################################################################################################################################

srcdir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd && echo)

msg(){ echo "$(tput bold; tput setaf 2)[+] ${*}$(tput sgr0)"; }

err(){ echo >&2 "$(tput bold; tput setaf 1)[-] ERROR: ${*}$(tput sgr0)" && exit 1 ; }

warn(){ echo >&2 "$(tput bold; tput setaf 1)[!] WARNING: ${*}$(tput sgr0)"; }

check_root(){ [ "$(id -u)" -ne 0 ] && err "root priviledges are required to run this script."; }

mkmnt(){ $(sudo mkdir -p /mnt/home/drives/"$1" >/dev/null 2>&1 && $(mount /dev/"$2" /mnt/home/drives/"$1") >/dev/null 2>&1) ; }

fail(){ err "   ERROR! CATASTROPHIC FAILIURE CAPTAIN . . ." ; sleep 2 ; }

requierments(){ pacman -Syy  figlet lolcat terminus-font sudo   --needed --noconfirm 2>/dev/null && setfont ter-p16n; }

welcome(){ clear ; figlet -toc '|-WELCOME-| - TO - |-AUTOLINUX-|' | lolcat ; sleep 1;
    echo -e "\n\n  Please use 'cfdisk' (recommended) or 'fdisk' to partition your drive before running this script.\n  Generally, a 550M EFI partition, a 2-10G swap partition,  and the rest of space dedicated to linux filesystem.\n" ; sleep 5 ; }


pac_conf(){
echo -e "\n# GENERAL OPTIONS\n\n[options]\n\n#RootDir     = /\n#DBPath      = /var/lib/pacman/\n#CacheDir    = /var/cache/pacman/pkg/
#LogFile     = /var/log/pacman.log\n#GPGDir      = /etc/pacman.d/gnupg/\n#HookDir     = /etc/pacman.d/hooks/\nHoldPkg      = pacman glibc
#XferCommand = /usr/bin/curl -L -C - -f -o %o %u\n#XferCommand = /usr/bin/wget --passive-ftp -c -O %o %u\n#CleanMethod = KeepInstalled
Architecture = auto\n\n#UseSyslog\nColor\nCheckSpace\nVerbosePkgLists\nILoveCandy\nParallelDownloads = 10\n\n\nSigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional\n#RemoteFileSigLevel = Required\n\n\n[core]\nInclude = /etc/pacman.d/mirrorlist\n\n[extra]\nInclude = /etc/pacman.d/mirrorlist\n
[community]\nInclude = /etc/pacman.d/mirrorlist\n\n[multilib]\nInclude = /etc/pacman.d/mirrorlist"; } 

refreshkeys() { \
  pacman -U --noconfirm https://gitlab.com/qyp/concise/-/raw/master/concise-keyring-1.0.3-1-any.pkg.tar.xz
  /opt/Concise/init.sh ; }

init(){  
pac_conf > /etc/pacman.conf &&
timedatectl set-ntp true ; }

partitioning(){ 
setfont ter-p16n &&

echo  -e "\n    Please specify the boot partition:"                                  
read -p "    ( Only the partition name, NOT the full path. )   : /dev/" boot 
case "$boot" in 
	''n) mkfs.vfat /dev/nvme0n1p1 ;;
      s) mkfs.vfat /dev/sda4 ;;
  	  *) mkfs.vfat /dev/"$boot"  
esac 
echo -e "\n    Please specify a swap partition if wanted,"                                  
read -p "    ( Only the partition name, NOT the full path. )  :  /dev/" swap 
case "$swap" in 
	''n)
	mkswap /dev/nvme0n1p2 && swapon /dev/nvme0n1p2 ;;
      s) mkswap /dev/sda3 && swapon /dev/sda3 ;; 
     "") ;; *) mkswap /dev/"$swap" && swapon /dev/"$swap" 
esac
echo -e "\n    Please specify partition name where base system will be installed. "                                 
read -p "    ( Only the partition name, NOT the full path. )   :  /dev/" drive 
case "$drive" in
	''n) mkfs.ext4 /dev/nvme0n1p3 && mount /dev/nvme0n1p3 /mnt ;;
      s) mkfs.ext4 /dev/sda5 && mount /dev/sda5 /mnt ;;
	  *) mkfs.ext4 /dev/"$drive" && mount /dev/"$drive" /mnt 
esac  

[ ! -d /mnt/boot/EFI ] && mkdir -p /mnt/boot/EFI ;
if [ $boot = n ]; then mount /dev/nvme0n1p1 /mnt/boot/EFI; fi
if [ $boot = s ]; then mount /dev/sda4 /mnt/boot/EFI; fi
mount /dev/$boot /mnt/boot/EFI 2>/dev/null ; clear ; setfont ter-p16n ;

msg "  Partitioning Completed Successfully!"  || 
err "Partitioning has failed miserably..." && sleep 2 && echo "" ; }

base_install(){	msg "  Beginning base installation..." ; sleep 2 && setfont ter-p14n ;

pacstrap /mnt \
    base base-devel multilib-devel linux-firmware linux linux-headers --needed --noconfirm &&
    pac_conf > /mnt/etc/pacman.conf && clear && setfont ter-p16n && 
    msg "  The Base Installation was a Success!" && sleep 2 || fail ; }

post_install(){ echo "" ; msg "  Installing additional system requierments..."; sleep 2 && setfont ter-p14n ;

pacstrap /mnt \
    archiso mkinitcpio mkinitcpio-archiso git curl neovim python-pynvim zsh ntfs-3g figlet xorg-xmodmap ufw networkmanager pulseaudio \
    pulseaudio-bluetooth pulsemixer bluez bluez-tools bluez-plugins bluez-libs wget lolcat grub efibootmgr dosfstools mtools pacman-contrib fzf \
    terminus-font os-prober  bash-completion --needed --noconfirm ; clear ; } 

cp_scripts(){ cd $srcdir && cp AutoLinux.sh .skell /mnt/tmp/ ; cp AutoInstall /mnt/usr/bin/AutoInstall >/dev/null 2>&1 ; }

success(){ clear ; setfont ter-p16n && echo -e "" &&
figlet -toc 'Success!'|lolcat ; echo -e "\n" ; sleep 2 && 
arch-chroot /mnt /usr/bin/AutoInstall ; clear ; }

check_root ; requierments ; # refreshkeys ; 
welcome ; init ; partitioning ; 
base_install && post_install ; drives ; 
cp_scripts ; success && exit 0 || fail && exit 1

#########################################################################################################################################################################################
#########################################################################################################################################################################################
