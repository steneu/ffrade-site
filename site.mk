##	gluon site.mk makefile

##      DEFAULT_GLUON_RELEASE
#               version string to use for images
#               gluon relies on
#                       opkg compare-versions "$1" '>>' "$2"
#               to decide if a version is newer or not.
DEFAULT_GLUON_RELEASE := 2018.1.3-rdv-4
#       GLUON_RELEASE
#               call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#               e.g.:
#                       $ make images GLUON_RELEASE=23.42+5
#               would generate images named like this:
#                       gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

#required for ath10k devices like C5/C7
GLUON_ATH10K_MESH ?= 11s

# Languages to include; supported values: en de
GLUON_LANGS ?= de

# Default priority for updates.
GLUON_PRIORITY ?= 0
##

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-wizard

GLUON_SITE_PACKAGES := \
	gluon-status-page \
	gluon-authorized-keys \
	gluon-web-admin \
	gluon-web-network \
	haveged \
	iwinfo	
	
# from FF-Nord (https://github.com/Freifunk-Nord/gluon-ssid-changer)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer

# from Freifunk-ffm
#GLUON_SITE_PACKAGES += \
#ffffm-additional-wifi-json-info

# from eulenfunk
GLUON_SITE_PACKAGES += \
	gluon-aptimeclock	

# support the USB stack
USB_PACKAGES_BASIC := \
	kmod-usb-core \
	kmod-usb2

# FAT32 Support for USB
USB_PACKAGES_STORAGE := \
        block-mount \
        kmod-fs-ext4 \
        kmod-fs-vfat \
        kmod-usb-storage  \
        kmod-usb-storage-extras  \
        blkid  \
        swap-utils  \
        kmod-nls-cp1250  \
        kmod-nls-cp1251  \
        kmod-nls-cp437  \
        kmod-nls-cp775  \
        kmod-nls-cp850  \
        kmod-nls-cp852  \
        kmod-nls-cp866  \
        kmod-nls-iso8859-1  \
        kmod-nls-iso8859-13  \
        kmod-nls-iso8859-15  \
        kmod-nls-iso8859-2  \
        kmod-nls-koi8r  \
        kmod-nls-utf8

USB_PACKAGES_NET := \
        kmod-ath9k-htc \
        kmod-usb-net \
        kmod-usb-net-asix \
        kmod-usb-net-asix-ax88179 \
        kmod-usb-net-cdc-eem \
        kmod-usb-net-cdc-ether \
        kmod-usb-net-cdc-mbim \
        kmod-usb-net-cdc-ncm \
        kmod-usb-net-cdc-subset \
        kmod-usb-net-dm9601-ether \
        kmod-usb-net-hso \
        kmod-usb-net-huawei-cdc-ncm \
        kmod-usb-net-ipheth \
        kmod-usb-net-kalmia \
        kmod-usb-net-kaweth \
        kmod-usb-net-mcs7830 \
        kmod-usb-net-pegasus \
        kmod-usb-net-qmi-wwan \
        kmod-usb-net-rndis \
        kmod-usb-net-rtl8150 \
        kmod-usb-net-rtl8152 \
        kmod-usb-net-sierrawireless \
        kmod-usb-net-smsc95xx \
        kmod-mii \
        kmod-nls-base

TOOLS_PACKAGES := \
        usbutils


ifeq ($(GLUON_TARGET),x86-generic)
# support the usb stack on x86 devices
# and add a few common USB NICs
GLUON_SITE_PACKAGES += \
        kmod-usb-hid \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-geode)
# support the usb stack on x86 devices
# and add a few common USB NICs
GLUON_SITE_PACKAGES += \
        kmod-usb-hid \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-64)
# support the usb stack on x86 devices
# and add a few common USB NICs
GLUON_SITE_PACKAGES += \
        kmod-usb-hid \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

# from Freifunk-ffm
##wifi-button pacakge only on some ar71-models ############################
	GLUON_tp-link-tl-wr740n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v4_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v5_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v4_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v5_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v8_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v9_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v10_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v11_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v12_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr842n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr842n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr842n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v4_SITE_PACKAGES := ffffm-button-bind
###########################################################################
