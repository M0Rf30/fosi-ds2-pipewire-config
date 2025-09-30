# PipeWire Configuration for Fosi DS2 with CS43131 DAC

This repository contains audiophile-optimized PipeWire configurations specifically tuned for the Fosi Audio DS2 DAC with CS43131 chip. The configurations prioritize high-resolution audio playback with minimal jitter and maximum fidelity.

## Hardware Specifications

### Fosi Audio DS2 (CS43131)
- **Vendor ID**: 0x262a (SAVITECH Corp.)
- **Product ID**: 0x0001
- **Device Name**: Fosi Audio DS2
- **Manufacturer**: Speed Dragon
- **Serial Number**: 5000000001
- **USB Version**: 2.0, High Speed (480Mbps)
- **Supported Sample Rates**: 44.1 kHz, 48 kHz, 88.2 kHz, 96 kHz, 176.4 kHz, 192 kHz, 352.8 kHz, 384 kHz
- **Supported Bit Depths**: 16-bit (S16_LE), 24-bit (S24_3LE), 32-bit (S32_LE)
- **DSD Support**: Direct Stream Digital up to DSD256 with DoP (DSD over PCM)
- **Channel Configuration**: 2-channel stereo (Front Left, Front Right)
- **Amplifier Type**: Class H with adaptive power supply
- **Max Output Power**: 30 mW per channel into 32 Ω, 5 mW per channel into 600 Ω
- **Dynamic Range**: 130 dB A-weighted
- **THD+N**: -115 dB
- **Output Voltage**: Up to 2 Vrms stereo output
- **Audio Interfaces**: 3 total (HID, Audio Control, Audio Streaming)
- **Endpoints**: Isochronous asynchronous with feedback synchronization
- **Power Source**: Bus Powered (100mA max from USB)
- **Power Architecture**: Multi-rail supply with separate analog/digital rails
- **HV_EN Setting**: Configurable high-voltage mode (2.6V/3.0V output)
- **Windows Driver Support**: Compatible with Bravo-HD USB Audio driver suite (BvoHdUAC/BvoHdCtl) recognizing device interfaces MI_01 (audio) and MI_06 (control)

## Configuration Files

- `pipewire.conf`: Main PipeWire daemon configuration with audiophile settings (drop-in: 50-fosi-ds2.conf)
- `client.conf`: Client-side configuration for audio applications (drop-in: 50-fosi-ds2.conf) 
- `wireplumber.conf`: WirePlumber policy configuration for device management (drop-in: 50-fosi-ds2.conf)
- `wireplumber.lua`: WirePlumber Lua script configuration as alternative format (place in main.lua.d/ directory)

## WirePlumber Configuration Formats

**Important**: WirePlumber 0.5+ has transitioned from the Lua-based configuration system of 0.4.x to a SPA-JSON based system. The main configuration is now done in SPA-JSON format, while Lua is primarily used for scripting complex behaviors.

1. **SPA JSON Format** (`wireplumber.conf`):
   - Uses declarative SPA JSON syntax with relaxed formatting (SPA JSON)
   - Loaded from `~/.config/wireplumber/wireplumber.conf.d/` directory
   - Supports rule-based matching with regex patterns (e.g., `node.name = "~alsa_output.*"`)
   - Uses `update-props` actions for property modifications
   - Recommended for all users as it's the primary configuration method in WirePlumber 0.5+

2. **Lua Script Format** (`wireplumber.lua`):
   - Uses Lua scripting for complex logic and dynamic behavior (secondary functionality)
   - Loaded from `~/.config/wireplumber/main.lua.d/` directory
   - Allows advanced conditional configuration and custom event handling
   - Provides access to WirePlumber's GObject-based API
   - Enables complex device management scenarios with programmatic control

The SPA JSON format is now the primary configuration method in WirePlumber 0.5+, while Lua scripts are used for more complex behavioral logic. WirePlumber follows a component-based architecture with hooks and policies for managing device profiles, routes, default nodes, and linking behavior.

## Key Features

- **High Sample Rates**: Supports up to 384kHz sample rate for high-resolution audio
- **Low Latency**: Optimized quantum settings (32-64 frames) for minimal jitter
- **Bit-Perfect Playback**: Settings to ensure audio data integrity
- **CS43131 Optimization**: Specific tuning for the CS43131 DAC capabilities including Class H amplifier support
- **DSD Support**: Full Direct Stream Digital support up to DSD256 with DoP (DSD over PCM)
- **Audiophile Tuning**: Low-jitter timing for improved dynamic range and reduced THD+N

## Installation

1. Copy the configuration files to your PipeWire configuration directory using the recommended drop-in approach:
   ```bash
   # Create drop-in directories
   mkdir -p ~/.config/pipewire/pipewire.conf.d/
   mkdir -p ~/.config/pipewire/client.conf.d/
   mkdir -p ~/.config/wireplumber/wireplumber.conf.d/
   mkdir -p ~/.config/wireplumber/main.lua.d/  # For Lua configuration (optional)
   
   # Copy new configurations as drop-ins
   cp pipewire.conf ~/.config/pipewire/pipewire.conf.d/50-fosi-ds2.conf
   cp client.conf ~/.config/pipewire/client.conf.d/50-fosi-ds2.conf
   cp wireplumber.conf ~/.config/wireplumber/wireplumber.conf.d/50-fosi-ds2.conf
   
   # Optional: Use Lua configuration instead of or in addition to wireplumber.conf
   cp wireplumber.lua ~/.config/wireplumber/main.lua.d/50-fosi-ds2.lua
   ```

2. Restart PipeWire services:
   ```bash
   # If systemctl available (though it's restricted in this environment):
   # systemctl --user restart pipewire pipewire-pulse wireplumber
   
   # Otherwise (recommended approach for this environment):
   pkill -f pipewire && pipewire & pipewire-pulse &
   
   # Reload WirePlumber configuration without restarting
   pkill -USR1 wireplumber
   ```

3. Alternative restart method if the above doesn't work:
   ```bash
   # Stop all PipeWire processes
   pkill -f pipewire
   
   # Start services manually
   pipewire &
   pipewire-pulse &
   
   # Verify processes are running
   pgrep -f pipewire
   ```

## Verification

After installation, verify the configuration is working with:

```bash
# Check active sample rate and device status
pw-metadata -n settings

# Test with high-resolution audio file (paplay recommended over pw-play)
paplay --device=alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo test_file.wav

# Monitor PipeWire state and actual operating rate
pw-top

# Check hardware supported rates (shows actual capabilities: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz)
cat /proc/asound/card0/stream0

# List available sinks to confirm device detection
pactl list sinks short

# Verify device appears in PipeWire
pw-cli ls Node | grep -i fosi

# Check configuration was loaded
pw-dump | grep -A 5 -B 5 "Fosi Audio DS2"
```

## Troubleshooting

If the configuration doesn't apply:

1. Check if the configuration files were copied correctly:
   ```bash
   ls -la ~/.config/pipewire/pipewire.conf.d/50-fosi-ds2.conf
   ls -la ~/.config/wireplumber/wireplumber.conf.d/50-fosi-ds2.conf
   ```

2. Verify PipeWire is using the configuration:
   ```bash
   # Check loaded modules
   pw-cli ls Module
   
   # Check node properties
   pw-cli dump Node | grep -A 20 -B 5 "Fosi"
   ```

3. Check for errors in PipeWire logs:
   ```bash
   # Check systemd logs if available
   # journalctl --user -u pipewire
   
   # Or check system logs
   dmesg | grep -i audio
   ```

4. If issues persist, restart your session or reboot to ensure all settings are applied.

## Usage

After installation, your Fosi DS2 should be automatically detected and configured with audiophile-grade settings. The configuration prioritizes CS43131 devices and applies optimal settings for high-quality audio playback.

## Verification

You can verify the configuration is working with:

```bash
# Check active sample rate and device status
pw-metadata -n settings

# Test with high-resolution audio file (paplay recommended over pw-play)
paplay --device=alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo test_384k.wav

# Monitor PipeWire state and actual operating rate
pw-top

# Check hardware supported rates (shows actual capabilities: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz)
cat /proc/asound/card0/stream0

# List available sinks to confirm device detection
pactl list sinks short
```

## Technical Notes

- Configuration uses PipeWire's recommended drop-in approach (pipewire.conf.d/, client.conf.d/, wireplumber.conf.d/)
- WirePlumber supports both SPA JSON (.conf) and Lua (.lua) configuration formats for device management
- The configuration enables support for DSD (Direct Stream Digital) audio formats via spa-libs and format declarations
- Power-of-two quantum settings for better timing accuracy
- Class H amplifier optimization for the CS43131's output stage
- Low-jitter timing for improved dynamic range and reduced THD+N
- Device operates at source material's native sample rate (negotiated between 44.1kHz and 384kHz as appropriate)
- DSD formats supported: DSD_U8, DSD_U16, DSD_U32, DSD_U64, DSD_ULB, DSD_UBY
- Hardware-accelerated feedback mechanisms for precise clock synchronization
- Support for all 4 alternate streaming settings (16-bit, 24-bit, 32-bit PCM and DSD)
- Based on system-wide PipeWire configuration patterns from `/usr/share/pipewire/`
- Uses standard PipeWire SPA JSON format with relaxed syntax (SPA JSON)
- Includes proper audio conversion libraries via `audio.convert.* = audioconvert/libspa-audioconvert`
- Implements device-specific rules and conditional properties for optimal performance
- Follows WirePlumber 0.5+ modular configuration approach with primary SPA JSON and secondary Lua scripting
- Supports WirePlumber's component-based architecture with hooks and policies
- Uses WirePlumber's rule-based system for device/node matching and property updates
- Includes ALSA-specific settings via `api.alsa.*` properties for optimal device handling
- Implements conditional logic based on device characteristics for dynamic configuration
- Supports regex matching with `~` prefix and negation with `!` prefix for flexible device matching
- Uses `update-props` actions for property modifications in rule-based configurations
- Leverages WirePlumber's persistent settings via `sm-settings` and `persistent-sm-settings` metadata objects
- Configurable via runtime commands using `wpctl settings` for dynamic adjustments
- Supports component dependencies with `requires` (mandatory) and `wants` (optional) relationships
- Configuration files now located in `~/.config/wireplumber/wireplumber.conf.d/` directory (WirePlumber 0.5+)
- Primary configuration is now in SPA-JSON format, with Lua used mainly for complex behavioral scripts

## Windows Driver Compatibility

The Fosi Audio DS2 is also supported on Windows through the Bravo-HD USB Audio driver suite, which provides:

- **BvoHdUAC.inf**: USB Audio Class driver for audio streaming interface (MI_01)
- **BvoHdCtl.inf**: Control driver for device configuration (MI_06)  
- **Device Recognition**: Explicitly supports `USB\VID_262A&PID_0001&MI_01` and `USB\VID_262A&PID_0001&MI_06`
- **Interface Support**: Properly handles both audio streaming and control interfaces
- **Audio Class 2.0**: Compliant with USB Audio Class 2.0 standards
- **High-Resolution Audio**: Supports up to 384kHz/32-bit PCM and DSD formats

The Windows driver information confirms the device's interface configuration and validates the USB Audio Class compliance that allows it to work with Linux ALSA snd_usb_audio driver as well.