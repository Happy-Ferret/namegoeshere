# namegoeshere
A new approach at a...web browser, in Vala

## TODO
- save tabs on exit, reopen on start
- bookmarks
- config file
- ^ which is also editable graphically through the browser
- disable javascript globally with a whitelist for specific domains
- automatically redirect to HTTPS, display visual warning when website only supports HTTP
- handle running this browser from shell, with website(s) as argument(s)

## Contribute
If you want to contribute, you'll need the following dependencies:
```
git - to clone the repository
make and cmake - build script
vala - converting the vala source to C
gtk3 - the graphical toolkit
webkitgtk4 - browser engine
```

### Arch Linux or Parabola GNU/Linux-libre
Arch Linux doesn't differenciate development packages from normal ones.
```
# pacman -S base-devel git cmake gtk3 webkit2gtk vala
$ ./generate
$ ./make
```

### Fedora
If you are running Fedora, this should get you started:
```
# dnf groupinstall "C Development Tools and Libraries"
# dnf install git cmake vala gtk3-devel webkitgtk4-devel
$ ./generate
$ ./make
```
