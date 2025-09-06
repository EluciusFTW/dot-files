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
You can choose different neovim configs by setting this env variable:
```bash
$ NVIM_APPNAME=nvim-lazyvim nvim
```
