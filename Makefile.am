# Makefile.am - Automake script for device-krypton

ACLOCAL_AMFLAGS = -I m4

if IS_QCM6490
dirs = wlan_qcm6490
endif

if IS_QCS8550
dirs = wlan_qcs8550
endif

dirs ?= wlan

SUBDIRS = $(dirs)
