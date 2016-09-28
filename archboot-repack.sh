rm build_dir
mkdir build_dir
cd build_dir
bsdtar xvf ../initramfs_x86_64.img 
echo -e "Server = http://mirrors.163.com/archlinux/\$repo/os/\$arch\nServer = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch\n"  >> etc/pacman.d/mirrorlist
sed -e "s/\[ -e \/arch\/setup \] && \/arch\/setup//g" -i  etc/profile
find . -print0 | bsdcpio -0oH newc | lzma -9 -e -v >  ../initramfs_x86_64_$(date -I"date").img

