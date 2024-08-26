# Making a custom dir for your apps

i once lost/misplaced a LastOS usb drive that had all my custom apz on it that i needed to reinstall windows
has it happened to you?

I had already setup a Lastos bootable usb drive
added all the additional custom files such a printer and WiFi drivers etc to this lastos drive

but all is not lost i had the individual files located on my external drive
i called this _newinstalls where all the custom files where stored
where i would normally install windows as per the usual way and then install my custom files from _newinstalls
i thought this would be time consuming while we have tools such as ssWpi to install it for us why not use it


## Procedure

Using rufus i pointed to the LastOS iso file and created a bootable flash drive
this comes with some handy portable (ppApps) and installable files (ssApps)
but i needed some unique apz that are not used on every computer

so my approach is the following:

* first created a ssAppsCustom folder
* placed all my custom files into this folder
* stored this folder on an external storage drive

* after creating a NEW bootable flash drive i can now add my ssAppsCustom folder and files
* then run ssWpi or AllMenu and select the menu install apps ssWpi first on the flash drive
* then right clicking on the main panel
* select add -->manual selection
* browse to ssAppsCustom folder
* click ok
* ssWpi will rerun and add your files contained in ssAppsCustom
* then it is just a matter of booting off the flash drive
* selecting ssWpi on the desktop
* selecting your files
* then install windows

At the end of install ssWpi will install the selected apps including custom ones
and you are left with a new install complete with your custom apps and drivers

Now you are ready to wock and woll
