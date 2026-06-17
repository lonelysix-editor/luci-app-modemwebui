# luci-app-modemwebui

`luci-app-modemwebui` is an OpenWrt LuCI package for a 5G modem WebUI.

This repository is an OpenWrt feed. It can be added to an OpenWrt buildroot and
compiled together with firmware images.

## Target

This package is intended for ARMv8/aarch64 OpenWrt routers, especially MT7987A
based devices.

The included `webuiserver` is a prebuilt aarch64 binary, so this package is not
intended for other CPU architectures.

## Dependencies

The package depends on:

- `qmodem`
- `luci-base`
- `usbutils`
- `libgcc`

`qmodem` provides the ubus interface used by the WebUI backend.

## Add This Feed

In your OpenWrt buildroot, add this repository to `feeds.conf.default` or
`feeds.conf`:

```sh
src-git modemwebui https://github.com/lonelysix-editor/luci-app-modemwebui.git
```

Update feeds and install the package into the buildroot:

```sh
./scripts/feeds update modemwebui
./scripts/feeds install luci-app-modemwebui
```

## Select Package

Run:

```sh
make menuconfig
```

Then select:

```text
LuCI -> 3. Applications -> luci-app-modemwebui
```

You can also enable it directly in `.config`:

```text
CONFIG_PACKAGE_luci-app-modemwebui=y
```

## Build

Build only this package:

```sh
make package/feeds/modemwebui/luci-app-modemwebui/compile V=s
```

Or build the full firmware image:

```sh
make V=s
```

## Installed Files

The package installs:

- `/etc/init.d/modemwebui`
- `/usr/bin/webuiserver`
- `/usr/lib/lua/luci/controller/modemwebui.lua`
- `/usr/lib/lua/luci/view/modemwebui/modemwebui.htm`
- `/usr/lib/lua/luci/i18n/medomwebui.zh-cn.lmo`
- `/www/webui/`

After installation, the `modemwebui` service is enabled and restarted by the
package post-install script.
