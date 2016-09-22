#                                               -*- Autoconf -*-
#
# configure.ac -- Autoconf script for device-krypton.
#

# Process this file with autoconf to produce a configure script

# Requires autoconf tool later than 2.61
AC_PREREQ(2.61)
# Initialize the ath6kl package version 1.0.0
AC_INIT([device-krypton],1.0.0)
# Does not strictly follow GNU Coding standards
AM_INIT_AUTOMAKE([foreign])
# Disables auto rebuilding of configure, Makefile.ins
AM_MAINTAINER_MODE
# defines some macros variable to be included by source
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_LIBTOOL
AC_PROG_AWK
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET

AC_ARG_ENABLE([target-mdm9607],
	AC_HELP_STRING([--enable-target-mdm9607],
		[Enable conditional compile for target mdm9607]),
	[target_mdm9607="${enableval}"],
	target_mdm9607=no)

AC_ARG_ENABLE([target-mdmcalifornium],
	AC_HELP_STRING([--enable-target-mdmcalifornium],
		[Enable conditional compile for target mdmcalifornium]),
	[target_mdmcalifornium="${enableval}"],
	target_mdmcalifornium=no)

AC_ARG_ENABLE([pronto-wlan],
	AC_HELP_STRING([--enable-pronto-wlan],
		[Enable pronto wlan compile for targets that support Pronto]),
	[pronto_wlan="${enableval}"],
	pronto_wlan=no)

AC_ARG_ENABLE([drone-wlan],
	AC_HELP_STRING([--enable-drone-wlan],
		[Enable drone wlan compile for targets that support drone]),
	[drone_wlan="${enableval}"],
	drone_wlan=no)

AM_CONDITIONAL([IS_MDM9607], [test "x$target_mdm9607" = xyes])

AM_CONDITIONAL([IS_MDMCALIFORNIUM], [test "x$target_mdmcalifornium" = xyes])

AM_CONDITIONAL([IS_PRONTO_ENABLED], [test "x$pronto_wlan" = xyes])

AM_CONDITIONAL([IS_DRONE], [test "x$drone_wlan" = xyes])

AC_CONFIG_FILES([Makefile])

AM_COND_IF([IS_MDM9607],
	[AC_CONFIG_FILES([wlan_sdio/Makefile])],
	[AC_CONFIG_FILES([wlan/Makefile])])
AC_OUTPUT

AM_COND_IF([IS_PRONTO_ENABLED],
	[AC_CONFIG_FILES([wlan_pronto/Makefile])])
AC_OUTPUT

AM_COND_IF([IS_DRONE],
	[AC_CONFIG_FILES([wlan_drone/Makefile])])
AC_OUTPUT
