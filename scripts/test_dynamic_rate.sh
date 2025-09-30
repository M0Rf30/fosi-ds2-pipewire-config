#!/bin/bash

# Test script for Fosi Audio DS2 dynamic sample rate switching
# This script tests whether the device automatically switches to the highest active stream rate

echo "Testing Fosi Audio DS2 dynamic sample rate switching configuration..."

# Check if PipeWire is running
if ! pgrep pipewire >/dev/null; then
    echo "PipeWire is not running. Please start PipeWire first."
    exit 1
fi

# Check if WirePlumber is running
if ! pgrep wireplumber >/dev/null; then
    echo "WirePlumber is not running. Please start WirePlumber first."
    exit 1
fi

echo "PipeWire and WirePlumber are running."

# Find the Fosi DS2 device
FOSI_DEVICE=$(wpctl status | grep -i "Fosi Audio DS2" | head -n1 | awk '{print $2}' | tr -d '.,')

if [ -z "$FOSI_DEVICE" ]; then
    echo "Fosi Audio DS2 device not found in wpctl status output."
    echo "Available sinks:"
    wpctl status | grep -A 10 "Audio/Sink"
    exit 1
fi

echo "Found Fosi Audio DS2 device: $FOSI_DEVICE"

# Test configuration files
echo "Verifying configuration files..."

if [ -f "/home/gianluca/fosi-ds2/pipewire.conf" ]; then
    echo "✓ pipewire.conf exists"
    
    # Check for important dynamic rate settings
    if grep -q "node.force-rate = 0" "/home/gianluca/fosi-ds2/pipewire.conf"; then
        echo "✓ Found 'node.force-rate = 0' in pipewire.conf"
    else
        echo "⚠ 'node.force-rate = 0' not found in pipewire.conf"
    fi
    
    if grep -q "node.lock-rate = false" "/home/gianluca/fosi-ds2/pipewire.conf"; then
        echo "✓ Found 'node.lock-rate = false' in pipewire.conf"
    else
        echo "⚠ 'node.lock-rate = false' not found in pipewire.conf"
    fi
    
    if grep -q "api.alsa.multi-rate" "/home/gianluca/fosi-ds2/pipewire.conf"; then
        echo "✓ Found 'api.alsa.multi-rate' in pipewire.conf"
    else
        echo "⚠ 'api.alsa.multi-rate' not found in pipewire.conf"
    fi
fi

if [ -f "/home/gianluca/fosi-ds2/wireplumber.conf" ]; then
    echo "✓ wireplumber.conf exists"
    
    # Check for important dynamic rate settings
    if grep -q "node.force-rate = 0" "/home/gianluca/fosi-ds2/wireplumber.conf"; then
        echo "✓ Found 'node.force-rate = 0' in wireplumber.conf"
    else
        echo "⚠ 'node.force-rate = 0' not found in wireplumber.conf"
    fi
    
    if grep -q "node.lock-rate = false" "/home/gianluca/fosi-ds2/wireplumber.conf"; then
        echo "✓ Found 'node.lock-rate = false' in wireplumber.conf"
    else
        echo "⚠ 'node.lock-rate = false' not found in wireplumber.conf"
    fi
    
    if grep -q "api.alsa.multi-rate" "/home/gianluca/fosi-ds2/wireplumber.conf"; then
        echo "✓ Found 'api.alsa.multi-rate' in wireplumber.conf"
    else
        echo "⚠ 'api.alsa.multi-rate' not found in wireplumber.conf"
    fi
fi

echo ""
echo "Configuration test complete."
echo ""
echo "To test dynamic rate switching functionality:"
echo "1. Play audio at 44.1kHz: paplay -r 44100 -b 16 --device=$FOSI_DEVICE /usr/share/sounds/alsa/Front_Left.wav"
echo "2. Play audio at 96kHz simultaneously: paplay -r 96000 -b 16 --device=$FOSI_DEVICE /usr/share/sounds/alsa/Front_Right.wav"
echo "3. The device should switch to 96kHz when the 96kHz stream starts"
echo "4. When the 96kHz stream stops, the device should switch back to 44.1kHz"
echo ""
echo "To check current device rate: cat /proc/asound/card*/stream0 (if using ALSA)"
echo "Or monitor with: wpctl status -m"