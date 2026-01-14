install_list = hostapd.conf wpa_supplicant.conf WCNSS_qcom_cfg_wcn7750.ini wlan
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

firmware_alordir = ${base_libdir}/firmware/wlan/qca_cld/wcn7750/
dist_firmware_alor_DATA = WCNSS_qcom_cfg_wcn7750.ini

# Rename WCNSS_qcom_cfg_wcn7750.ini to WCNSS_qcom_cfg.ini
install-data-hook:$(DESTDIR)$(firmware_alordir)/WCNSS_qcom_cfg_wcn7750.ini
	cd $(DESTDIR)$(firmware_alordir) && \
		mv -f WCNSS_qcom_cfg_wcn7750.ini WCNSS_qcom_cfg.ini
