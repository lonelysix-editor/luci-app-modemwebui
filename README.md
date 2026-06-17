# luci-app-modemwebui

OpenWrt LuCI package for a 5G modem WebUI on ARMv8/aarch64 routers.

This package is intended for ARMv8 routers such as MT7987A based devices. It
installs the LuCI entry, bundled web assets, the `webuiserver` backend, and the
`modemwebui` init script.

## Dependencies

- `qmodem`
- `luci-base`
- `usbutils`
- `libgcc`

The backend uses the ubus interface provided by `qmodem`; `ubus` is not listed
as a separate package dependency.

## Use As An OpenWrt Feed

Add this repository to `feeds.conf.default` or `feeds.conf`:

```sh
src-git modemwebui https://github.com/<user>/<repo>.git
```

Update and install the feed package:

```sh
./scripts/feeds update modemwebui
./scripts/feeds install luci-app-modemwebui
```

Select the package:

```text
LuCI -> 3. Applications -> luci-app-modemwebui
```

Build it:

```sh
make package/feeds/modemwebui/luci-app-modemwebui/compile V=s
```

Or include it in the firmware image through `make menuconfig`.

## Alternative: Manual Feed Clone

You can also clone the repository into `feeds/` manually and install it from
there:

```sh
git clone https://github.com/<user>/<repo>.git feeds/modemwebui
./scripts/feeds install -p modemwebui luci-app-modemwebui
```
