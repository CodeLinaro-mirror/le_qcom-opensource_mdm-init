install_list = hostapd.conf wpa_supplicant.conf WCNSS_qcom_cfg_wcn7750.ini \
		WCNSS_qcom_cfg_wcn7760.ini wlan
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

firmware_keradir = ${base_libdir}/firmware/wlan/qca_cld/
dist_firmware_kera_DATA = WCNSS_qcom_cfg_wcn7750.ini
dist_firmware_kera_DATA += WCNSS_qcom_cfg_wcn7760.ini

# Rename WCNSS_qcom_cfg_wcn7750.ini to WCNSS_qcom_cfg.ini
install-data-hook:$(DESTDIR)$(firmware_keradir)/WCNSS_qcom_cfg_wcn7750.ini
	cd $(DESTDIR)$(firmware_keradir) && \
		mv -f WCNSS_qcom_cfg_wcn7750.ini WCNSS_qcom_cfg.ini && \
		mkdir -p qca_cld3_wcn7760 && \
		mv -f WCNSS_qcom_cfg_wcn7760.ini qca_cld3_wcn7760/WCNSS_qcom_cfg.ini
