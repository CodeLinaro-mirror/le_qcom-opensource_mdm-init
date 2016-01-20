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
AC_ARG_ENABLE([target-apq8009],
	AC_HELP_STRING([--enable-target-apq8009],
		[Enable conditional compile for target apq8009]),
	[target_apq8009="${enableval}"],
	target_apq8009=no)

AM_CONDITIONAL([IS_MDM9607], [test "x$target_mdm9607" = xyes])

AM_CONDITIONAL([IS_APQ8009], [test "x$target_apq8009" = xyes])

AC_CONFIG_FILES([Makefile])

AM_COND_IF([IS_MDM9607],
	[AC_CONFIG_FILES([wlan_sdio/Makefile])],
	[AC_CONFIG_FILES([wlan/Makefile])])
AC_OUTPUT

AM_COND_IF([IS_APQ8009],
	[AC_CONFIG_FILES([wlan_pronto/Makefile])])
AC_OUTPUT
