PKG_SRC_DIR:=$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-modemwebui
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=
PKG_LICENSE:=Unknown
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-modemwebui
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI app for 5G modem WebUI on ARMv8 routers
  DEPENDS:=@aarch64 +luci-base +qmodem +usbutils +libgcc
endef

define Package/luci-app-modemwebui/description
LuCI integration and embedded WebUI service for 5G modem modules on
ARMv8/aarch64 routers, such as MT7987A based devices.
The package installs the LuCI controller/view, bundled web assets,
the modem WebUI backend, and the procd init script. It depends on the
qmodem ubus interface.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(PKG_SRC_DIR)/etc $(PKG_SRC_DIR)/usr $(PKG_SRC_DIR)/www $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-modemwebui/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/modemwebui $(1)/etc/init.d/modemwebui

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/webuiserver $(1)/usr/bin/webuiserver

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/usr/lib/. $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/www
	$(CP) $(PKG_BUILD_DIR)/www/. $(1)/www/
endef

define Package/luci-app-modemwebui/postinst
#!/bin/sh

if [ -n "$${IPKG_INSTROOT}" ]; then
	mkdir -p "$${IPKG_INSTROOT}/etc/rc.d"
	ln -sf ../init.d/modemwebui "$${IPKG_INSTROOT}/etc/rc.d/S99modemwebui"
else
	/etc/init.d/modemwebui enable >/dev/null 2>&1 || true
	/etc/init.d/modemwebui restart >/dev/null 2>&1 || true
fi

exit 0
endef

define Package/luci-app-modemwebui/prerm
#!/bin/sh

if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/modemwebui stop >/dev/null 2>&1 || true
	/etc/init.d/modemwebui disable >/dev/null 2>&1 || true
fi

exit 0
endef

$(eval $(call BuildPackage,luci-app-modemwebui))
