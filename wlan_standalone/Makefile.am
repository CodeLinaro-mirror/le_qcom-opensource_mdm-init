etcdir = ${sysconfdir}
dist_etc_DATA = cld-hostapd-wlan0.sh
dist_etc_DATA += cld-hostapd-wlan1.sh

misc_ddir = ${datadir}/misc/wifi
dist_misc_d_DATA = hostapd.conf
dist_misc_d_DATA += hostapd-wlan1.conf
dist_misc_d_DATA += sta_mode_hostapd.conf
dist_misc_d_DATA += wpa_supplicant.conf

init_ddir = ${sysconfdir}/init.d
dist_init_d_SCRIPTS = wlan

firmware_ddir = ${base_libdir}/firmware/wlan
dist_firmware_d_DATA = qcom_cfg.ini

if NEED_SDIO_INI

# Copy qcom_cfg.sdio.ini to ../firmware/wlan/qca9377/
firmware_qca9377dir = ${base_libdir}/firmware/wlan/qca9377
dist_firmware_qca9377_DATA = qcom_cfg.sdio.ini

firmware_qca6574dir = ${base_libdir}/firmware/wlan/qca6574
dist_firmware_qca6574_DATA = qcom_cfg.sdio.rome.ini

# Rename qcom_cfg.sdio.ini to qcom_cfg.ini
install-data-hook:$(DESTDIR)$(firmware_qca9377dir)/qcom_cfg.sdio.ini
	cd $(DESTDIR)$(firmware_qca9377dir) && \
		mv -f qcom_cfg.sdio.ini qcom_cfg.ini && \
	cd $(DESTDIR)$(firmware_qca6574dir) && \
		mv -f qcom_cfg.sdio.rome.ini qcom_cfg.ini

endif
