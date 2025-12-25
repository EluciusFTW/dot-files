# EluciusFTWs dot-files
These are my personal dot-files. I am just getting started on my linux journey after being a Windows user for many years, so there is nothing special to see here, just some very basic stuff :)

## Importing via stow
In the root of the repo there is the `/stow` folder. All configs inside have been structuren in such a way that running the following command from inside that folder symlinks all files to the default location under linux:

```bash
stow * -t ~
```
If you are interested only in the files of specific folders, these can be symlinked via:
```bash
stow <folder1> <folder2> ... -t ~
```

## Symlink on Windows
Using Nushell (in elevated session)

```bash
symlink "C:/Users/EluciusFTW/sources/dot-files/stow/nvim/.config/nvim" "C:/Users/EliciusFTW/AppData/Local/nvim"
```
or cmd (not the reverse order)
```cmd
mklink /D "C:\Users\guysb\AppData\Local\nvim-own" "C:\Users\guysb\dot-files\stow\nvim\.config\nvim-own"
```

## Switch Neovim config
The config folder contians two neovim configurations (`nvim` and `nvim-own`). The latter one is the actively maintained one and is enabled via setting an environment variable:
```bash
$ NVIM_APPNAME=nvim-lazyvim nvim
```
If you use the .bashrc from this repo, that is done there automatically.
