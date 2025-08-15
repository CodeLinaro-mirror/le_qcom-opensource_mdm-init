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

AC_ARG_ENABLE([target-qcs405-som1],
	AC_HELP_STRING([--enable-target-qcs405-som1],
		[Enable conditional compile for target qcs405-som1]),
	[target_qcs405som1="${enableval}"],
	target_qcs405som1=no)

AC_ARG_ENABLE([target-sdmsteppe],
	AC_HELP_STRING([--enable-target-sdmsteppe],
		[Enable conditional compile for target sdmsteppe]),
	[target_sdmsteppe="${enableval}"],
	target_sdmsteppe=no)

AC_ARG_ENABLE([target-qrb5165],
	AC_HELP_STRING([--enable-target-qrb5165],
		[Enable conditional compile for target qrb5165]),
	[target_qrb5165="${enableval}"],
	target_qrb5165=no)

AC_ARG_ENABLE([target-sdxlemur],
	AC_HELP_STRING([--enable-target-sdxlemur],
		[Enable conditional compile for target sdxlemur]),
	[target_sdxlemur="${enableval}"],
	target_sdxlemur=no)

AC_ARG_ENABLE([target-neo],
	AC_HELP_STRING([--enable-target-neo],
		[Enable conditional compile for target neo]),
	[target_neo="${enableval}"],
	target_neo=no)

AC_ARG_ENABLE([target-sdxpinn],
	AC_HELP_STRING([--enable-target-sdxpinn],
		[Enable conditional compile for target sdxpinn]),
	[target_sdxpinn="${enableval}"],
	target_sdxpinn=no)

AC_ARG_ENABLE([target-kalama],
	AC_HELP_STRING([--enable-target-kalama],
		[Enable conditional compile for target kalama]),
	[target_kalama="${enableval}"],
	target_kalama=no)

AC_ARG_ENABLE([target-pineapple],
	AC_HELP_STRING([--enable-target-pineapple],
		[Enable conditional compile for target pineapple]),
	[target_pineapple="${enableval}"],
	target_pineapple=no)

AC_ARG_ENABLE([target-qcm2290-mtp],
        AC_HELP_STRING([--enable-target-qcm2290-mtp],
                [Enable conditional compile for target qcm2290mtp]),
        [target_qcm2290mtp="${enableval}"],
        target_qcm2290mtp=no)

AC_ARG_ENABLE([target-kera],
        AC_HELP_STRING([--enable-target-kera],
                [Enable conditional compile for target kera]),
        [target_kera="${enableval}"],
        target_kera=no)

AM_CONDITIONAL([IS_MDM9607], [test "x$target_mdm9607" = xyes])

AM_CONDITIONAL([IS_MDMCALIFORNIUM], [test "x$target_mdmcalifornium" = xyes])

AM_CONDITIONAL([IS_PRONTO_ENABLED], [test "x$pronto_wlan" = xyes])

AM_CONDITIONAL([IS_DRONE], [test "x$drone_wlan" = xyes])

AM_CONDITIONAL([IS_QCS405SOM1], [test "x$target_qcs405som1" = xyes])

AM_CONDITIONAL([IS_QRB5165], [test "x$target_qrb5165" = xyes])

AM_CONDITIONAL([IS_SDMSTEPPE], [test "x$target_sdmsteppe" = xyes])

AM_CONDITIONAL([IS_SDXLEMUR], [test "x$target_sdxlemur" = xyes])

AM_CONDITIONAL([IS_NEO], [test "x$target_neo" = xyes])

AM_CONDITIONAL([IS_SDXPINN], [test "x$target_sdxpinn" = xyes])

AM_CONDITIONAL([IS_KALAMA], [test "x$target_kalama" = xyes])

AM_CONDITIONAL([IS_PINEAPPLE], [test "x$target_pineapple" = xyes])

AM_CONDITIONAL([IS_QCM2290MTP], [test "x$target_qcm2290mtp" = xyes])

AM_CONDITIONAL([IS_KERA], [test "x$target_kera" = xyes])

AC_CONFIG_FILES([Makefile])

# Collect install dir, wlan as default dir
install_dir="wlan"

AM_COND_IF([IS_MDM9607], [
	AC_CONFIG_FILES([wlan_sdio/Makefile])
	install_dir="wlan_sdio"
])

AM_COND_IF([IS_PRONTO_ENABLED], [
	AC_CONFIG_FILES([wlan_pronto/Makefile])
	install_dir="wlan_prontoe"
])

AM_COND_IF([IS_DRONE], [
	AC_CONFIG_FILES([wlan_drone/Makefile])
	install_dir="wlan_drone"
])

AM_COND_IF([IS_QCS405SOM1], [
	AC_CONFIG_FILES([wlan_qcs405-som1_qsap/Makefile])
	install_dir="wlan_qcs405-som1_qsap"
])

AM_COND_IF([IS_SDMSTEPPE], [
	AC_CONFIG_FILES([wlan_sdmsteppe/Makefile])
	install_dir="wlan_sdmsteppe"
])

AM_COND_IF([IS_QRB5165], [
	AC_CONFIG_FILES([wlan_qrb5165/Makefile])
	install_dir="wlan_qrb5165"
])

AM_COND_IF([IS_SDXLEMUR], [
	AC_CONFIG_FILES([wlan_sdxlemur/Makefile])
	install_dir="wlan_sdxlemur"
])

AM_COND_IF([IS_NEO], [
	AC_CONFIG_FILES([wlan_neo/Makefile])
	install_dir="wlan_neo"
])

AM_COND_IF([IS_SDXPINN], [
	AC_CONFIG_FILES([wlan_sdxpinn/Makefile])
	install_dir="wlan_sdxpinn"
])

AM_COND_IF([IS_KALAMA], [
	AC_CONFIG_FILES([wlan_kalama/Makefile])
	install_dir="wlan_kalama"
])

AM_COND_IF([IS_PINEAPPLE], [
	AC_CONFIG_FILES([wlan_pineapple/Makefile])
	install_dir="wlan_pineapple"
])

AM_COND_IF([IS_QCM2290MTP], [
	AC_CONFIG_FILES([wlan_qcm2290-mtp/Makefile])
	install_dir="wlan_qcm2290-mtp"
])

AM_COND_IF([IS_KERA], [
	AC_CONFIG_FILES([wlan_kera/Makefile])
	install_dir="wlan_kera"
])

# Final output
AC_SUBST([install_dir])
AC_OUTPUT

