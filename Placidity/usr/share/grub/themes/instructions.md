>sudo cp EOSGrub/ -r /usr/share/grub/themes/

>sudo nvim /etc/default/grub

Change `#GRUB_THEME=` to `GRUB_THEME="/usr/share/grub/themes/tartarus/theme.txt"`

>sudo grub-mkconfig -o /boot/grub/grub.cfg

[Credits.](https://github.com/AllJavi/tartarus-grub/tree/master)