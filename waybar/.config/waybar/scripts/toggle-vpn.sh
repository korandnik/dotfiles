#!/bin/bash

VPN_IF="wg0"
WG_CMD="sudo wg-quick"

if ip link show "$VPN_IF" &>/dev/null; then
  $WG_CMD down "$VPN_IF" && notify-send "WireGuard" "Disconnected $VPN_IF"
else
  $WG_CMD up "$VPN_IF" && notify-send "WireGuard" "Connected $VPN_IF"
fi

