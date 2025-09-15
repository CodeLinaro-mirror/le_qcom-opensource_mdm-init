install_list = hostapd.conf wpa_supplicant.conf WCNSS_qcom_cfg_peach_v2.ini wlan
BUILT_SOURCES = $(install_list)
EXTRA_DIST = $(install_list)

$(install_list):
	@echo "Processing $@ ..."
	@if [ ! -f "$@" ] && [ -f "$(srcdir)/../wlan/$@" ]; then \
		echo "Copying $(srcdir)/../wlan/$@ to $@"; \
		cp "$(srcdir)/../wlan/$@" "$@"; \
	fi

init_ddir = ${sysconfdir}/init.d
dist_init_d_SCRIPTS = wlan

misc_ddir = ${userfsdatadir}/misc/wifi
dist_misc_d_DATA = hostapd.conf
dist_misc_d_DATA += wpa_supplicant.conf

firmware_sundir = ${base_libdir}/firmware/wlan/qca_cld/peach_v2
dist_firmware_sun_DATA = WCNSS_qcom_cfg_peach_v2.ini

# Rename WCNSS_qcom_cfg_peach_v2.ini to WCNSS_qcom_cfg.ini
install-data-hook:$(DESTDIR)$(firmware_sundir)/WCNSS_qcom_cfg_peach_v2.ini
	cd $(DESTDIR)$(firmware_sundir) && \
		mv -f WCNSS_qcom_cfg_peach_v2.ini WCNSS_qcom_cfg.ini

