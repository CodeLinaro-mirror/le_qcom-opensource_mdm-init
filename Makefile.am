# Makefile.am - Automake script for device-krypton

etcdir = ${sysconfdir}
dist_etc_DATA = sysctl.conf

ACLOCAL_AMFLAGS = -I m4

if IS_MDM9607
dirs = wlan_sdio
else
if IS_APQ8009_ROME
dirs = wlan_rome
else
if IS_WLAN_PRONTO
dirs = wlan_pronto
else
dirs = wlan
endif
endif
endif

SUBDIRS = $(dirs)
