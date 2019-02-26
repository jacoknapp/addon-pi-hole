#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Pi-hole
# Ensures the required log files exists on the persistant storage
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

mkdir -p /data/log

# Fix the permissions on the logrotate script so logs get cleared
chmod 644 /etc/logrotate.d/pihole

if ! hass.file_exists '/data/log/pihole.log'; then
    touch /data/log/pihole.log
    chmod 644 /data/log/pihole.log
    chown pihole:root /data/log/pihole.log
fi

ln -sf /data/log/pihole.log /var/log/pihole.log

if ! hass.file_exists '/data/log/pihole-FTL.log'; then
    touch /data/log/pihole-FTL.log
    chmod 644 /data/log/pihole-FTL.log
    chown pihole:root /data/log/pihole-FTL.log
fi

ln -sf /data/log/pihole-FTL.log /var/log/pihole-FTL.log
