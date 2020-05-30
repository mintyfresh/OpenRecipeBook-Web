# Building the flatpak

    $ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    $ flatpak install flathub org.freedesktop.Sdk//19.08
    $ ./build.sh

# Installing and running the flatpak

    $ flatpak install --user com.github.MihailK.OpenRecipeBookWeb.flatpak
    $ flatpak run com.github.MihailK.OpenRecipeBookWeb
