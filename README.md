# Chrome and Opera Extention Icons, Rebuilded

## Install

```bash
make install
```

The default installation target is set to Chrome and Opera, if you want to install it for another borwser, please specify the extensions directory of that browser with the `TARGET=` option. Example for Opera Developer: `make install TARGET="$HOME/Library/Application Support/com.operasoftware.OperaDeveloper/Extensions"`.

After installing, you'll need to restart the browser or disable and re-enable each extention for the changes to make effect.


## Uninstall

```base
make uninstall
```

The options are same as `make install`.
