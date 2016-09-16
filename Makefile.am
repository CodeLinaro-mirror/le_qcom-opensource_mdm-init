# Makefile.am - Automake script for device-krypton

etcdir = ${sysconfdir}
dist_etc_DATA = sysctl.conf

ACLOCAL_AMFLAGS = -I m4

if IS_MDM9607
dirs = wlan_sdio
else
if IS_PRONTO_ENABLED
dirs = wlan_pronto
else
dirs = wlan
endif
endif

SUBDIRS = $(dirs)
