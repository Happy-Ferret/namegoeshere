# namegoeshere
A new approach at a...web browser, in Vala

# TODO
- save tabs on exit, reopen on start
- bookmarks
- disable javascript globally with a whitelist for specific domains
- automatically redirect to HTTPS, display visual warning when website only supports HTTP
- handle running this browser from shell, with website(s) as argument(s)

# Contribute
If you want to contribute, you'll need the following dependencies:
```
cmake
vala
gtk3
webkitgtk4
```

If you are running Fedora, this should get you started:
```
# dnf install git cmake vala gtk3-devel webkitgtk4-devel
```
