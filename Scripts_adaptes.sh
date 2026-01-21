#!/bin/bash
# Scripts d'extraction/configuration read-only pour vendors courants
# A utiliser uniquement avec autorisation (ROE)
# Ne pas exécuter sans backup et permissions

set -e

echo "[*] Scripts d'audit - Adaptation par vendor"
echo "[*] Modifiez les variables HOST, USER, APIKEY avant usage"

########################################
# Cisco IOS / IOS‑XE (SSH)
########################################
cisco_show() {
  HOST="$1"
  USER="$2"
  OUTDIR="$3"
  echo "### Cisco ($HOST) ###"
  ssh ${USER}@${HOST} "terminal length 0; show running-config" > "${OUTDIR}/cisco_${HOST}_running.cfg"
  ssh ${USER}@${HOST} "show version" > "${OUTDIR}/cisco_${HOST}_version.txt"
  ssh ${USER}@${HOST} "show ip interface brief" > "${OUTDIR}/cisco_${HOST}_ip_brief.txt"
  ssh ${USER}@${HOST} "show vlan brief" > "${OUTDIR}/cisco_${HOST}_vlan.txt"
  ssh ${USER}@${HOST} "show access-lists" > "${OUTDIR}/cisco_${HOST}_acl.txt"
  echo "[OK] Cisco configs exported to ${OUTDIR}"
}

########################################
# Palo Alto (PAN‑OS) - API
########################################
palo_alto_dump() {
  HOST="$1"
  APIKEY="$2"
  OUTDIR="$3"
  echo "### Palo Alto ($HOST) ###"
  curl -k "https://${HOST}/api/?type=op&cmd=<show><system><info></info></system></show>&key=${APIKEY}" -o "${OUTDIR}/paloalto_${HOST}_system_info.xml"
  curl -k "https://${HOST}/api/?type=config&action=get&key=${APIKEY}" -o "${OUTDIR}/paloalto_${HOST}_config.xml"
  echo "[OK] Palo Alto configs exported to ${OUTDIR}"
}

########################################
# FortiGate (FortiOS) - SSH
########################################
fortigate_dump() {
  HOST="$1"
  USER="$2"
  OUTDIR="$3"
  echo "### FortiGate ($HOST) ###"
  ssh ${USER}@${HOST} "get system status" > "${OUTDIR}/fortigate_${HOST}_status.txt"
  ssh ${USER}@${HOST} "show full-configuration" > "${OUTDIR}/fortigate_${HOST}_config.txt"
  ssh ${USER}@${HOST} "show firewall policy" > "${OUTDIR}/fortigate_${HOST}_policy.txt"
  echo "[OK] FortiGate configs exported to ${OUTDIR}"
}

########################################
# Meraki (Cloud-managed) - API
########################################
meraki_api() {
  APIKEY="$1"
  ORG_ID="$2"
  OUTDIR="$3"
  echo "### Meraki API ###"
  curl -H "X-Cisco-Meraki-API-Key: ${APIKEY}" \
    "https://api.meraki.com/api/v1/organizations/${ORG_ID}/networks" \
    -o "${OUTDIR}/meraki_org_${ORG_ID}_networks.json"
  echo "[OK] Meraki data exported to ${OUTDIR}"
}

########################################
# Ubiquiti UniFi - Controller API
########################################
unifi_dump() {
  CONTROLLER="$1"
  USER="$2"
  PASS="$3"
  OUTDIR="$4"
  echo "### UniFi Controller (${CONTROLLER}) ###"
  curl -c "${OUTDIR}/unifi_cookie.txt" -d "username=${USER}&password=${PASS}" \
    "https://${CONTROLLER}:8443/api/login"
  curl -b "${OUTDIR}/unifi_cookie.txt" \
    "https://${CONTROLLER}:8443/api/s/default/stat/device" \
    -o "${OUTDIR}/unifi_devices.json"
  echo "[OK] UniFi data exported to ${OUTDIR}"
}

########################################
# Juniper (Junos) - SSH
########################################
juniper_dump() {
  HOST="$1"
  USER="$2"
  OUTDIR="$3"
  echo "### Juniper ($HOST) ###"
  ssh ${USER}@${HOST} "show configuration | display set" > "${OUTDIR}/juniper_${HOST}_config.txt"
  ssh ${USER}@${HOST} "show route" > "${OUTDIR}/juniper_${HOST}_routes.txt"
  echo "[OK] Juniper configs exported to ${OUTDIR}"
}

########################################
# Usage example
########################################
OUTDIR="./audit_exports_$(date +%Y%m%d)"
mkdir -p "$OUTDIR"

# Décommentez et adaptez selon vos équipements:
# cisco_show "192.168.1.1" "admin" "$OUTDIR"
# palo_alto_dump "firewall.example.com" "YOUR_API_KEY" "$OUTDIR"
# fortigate_dump "192.168.1.254" "admin" "$OUTDIR"
# meraki_api "YOUR_MERAKI_KEY" "ORG_ID" "$OUTDIR"
# unifi_dump "unifi.example.com" "admin" "password" "$OUTDIR"
# juniper_dump "192.168.1.100" "admin" "$OUTDIR"

echo "[*] Script terminé. Vérifiez les exports dans $OUTDIR"
