# Home Assistant installer images

Buildroot is a git submodule in `buildroot/`. Board support, packages and
the installer rootfs overlay live in the br2-external tree in
`buildroot-external/`.

```sh
git clone --recurse-submodules https://github.com/NabuCasa/buildroot-installer.git
make help
```

Each `buildroot-external/configs/<target>_defconfig` becomes a target.
`make <target>` builds it into `output/<target>/images/`.

Any buildroot goal runs against a target with `make <target>-<goal>`:

```sh
make <target>-menuconfig
make <target>-linux-rebuild
```
