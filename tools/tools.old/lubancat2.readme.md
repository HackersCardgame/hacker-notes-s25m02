rkdeveloptool db <loader>
  rk356x_spl_loader_ddr1056_v1.10.111.bin

rkdeveloptool wl 0 <image>
  <image> = zcat uboot...gz debain-trixie...gz image.img

RockChip RK3568

fdisk print
growpart /dev/mmc... 2
   ->kann man mit apt-file finden

resize2fs /dev/mmx...p2
