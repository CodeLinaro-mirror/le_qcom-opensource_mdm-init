#!/bin/sh
#
# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
# SPDX-License-Identifier: BSD-3-Clause-Clear

# Name: multi-vif bring-up helper
# Purpose: Manage wireless interfaces on the same PHY (wlan0) in the following sequence:
#          1) Wait for the physical interface wlan0 to appear (up to 30s);
#          2) Poll wlan0 to check if it is connected as a STA (up to 60s;
#          3) If wlan1 does not exist, create it as a managed (STA) interface;
#          4) Poll to see if any interface is in AP mode (wlan0 or wlan1; up to 60s);
#          5) If AP mode is detected, then create a second managed interface wlan2.

set -e

LOG_FILE="/tmp/multi-vif.log"

PHY_IF_0="wlan0"
VIF_1="wlan1"
VIF_2="wlan2"

vif_log() {
    printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" >> "$LOG_FILE"
}

vif_log "Waiting $PHY_IF_0 up ..."

PHY_READY=0
for i in $(seq 1 30); do
    if iw dev | grep -q "$PHY_IF_0"; then
        PHY_READY=1
        break
    fi
    sleep 1
done

if [ "$PHY_READY" -ne 1 ]; then
    vif_log "Timeout: $PHY_IF_0 is not up!"
    exit 1
fi

check_sta_connected() {
    local iface=$1
    iw "$iface" link 2>/dev/null | grep -q "Connected to"
}

vif_log "Waiting for $PHY_IF_0 (STA) to connect ..."

STA_READY=0
for i in $(seq 1 60); do
    if check_sta_connected "$PHY_IF_0"; then
        vif_log "$PHY_IF_0 STA connected."
        STA_READY=1
        break
    fi

    vif_log "STA not connected yet... i=$i"
    sleep 1
done

if [ "$STA_READY" -ne 1 ]; then
    vif_log "Warning: $PHY_IF_0 STA not connected!"
fi


if ! iw dev | grep -q "Interface $VIF_1"; then
    vif_log "Create $VIF_1 ..."
    iw dev "$PHY_IF_0" interface add $VIF_1 type managed
else
    vif_log "$VIF_1 exist,skip ..."
fi

check_ap_mode() {
    local iface=$1
    iw dev "$iface" info 2>/dev/null | grep -q "type AP"
}

AP_READY=0
for i in $(seq 1 60); do
    if check_ap_mode $PHY_IF_0; then
        vif_log "Detected $PHY_IF_0 in AP mode."
        AP_READY=1
        break
    fi

    if check_ap_mode $VIF_1; then
        vif_log "Detected $VIF_1 in AP mode."
        AP_READY=1
        break
    fi

    vif_log "waiting $i"

    sleep 1
done

if [ "$AP_READY" -ne 1 ]; then
    vif_log "Timeout: $PHY_IF_0 and $VIF_1 not AP, won't create $VIF_2!"
    exit 0
fi

if ! iw dev | grep -q "Interface $VIF_2"; then
    vif_log "Create $VIF_2 ..."
    iw dev "$PHY_IF_0" interface add $VIF_2 type managed
else
    vif_log "$VIF_2 exist,skip ..."
fi
