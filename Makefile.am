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
if IS_DRONE
dirs = wlan_drone
else
if IS_QCS405SOM1
dirs = wlan_qcs405-som1_qsap
else
dirs = wlan
endif
endif
endif
endif

SUBDIRS = $(dirs)
