# AGENTS.md: Guidelines for Fosi DS2 PipeWire Config Repo

## Build/Lint/Test Commands
No traditional build system; configs are declarative. Use PipeWire tools for validation:
- Load configs: `pkill -f pipewire && pipewire & pipewire-pulse &` (manual restart)
- Single test: `./scripts/test_dynamic_rate.sh` (tests dynamic rate switching)
- Test playback: `paplay /path/to/test.wav` (recommended over pw-play)
- Single device test: `paplay --device=alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo /path/to/test.wav`
- High-res test: `paplay --device="alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo" --rate=384000 --format=S32LE test_file.wav`
- Monitor: `pw-top` or `pw-dump > state.json` for state inspection
- Reload WirePlumber: `pkill -USR1 wireplumber` without restarting
- Device discovery: `lsusb -d 262a:0001` and `wpctl status | grep -i fosi`
- Check device rates: `cat /proc/asound/card*/stream0` to verify supported sample rates
- PipeWire node inspection: `pw-cli ls Node | grep -i fosi`

## Code Style Guidelines
### PipeWire Configs (pipewire.conf, client.conf, etc.)
- Format: SPA JSON relaxed syntax (= for :, no quotes if no specials, # comments)
- Naming: Lowercase with hyphens (default.clock.rate); avoid uppercase
- Properties: Follow PipeWire defaults (allowed-rates=[44100 48000 96000 176400 192000 352800 384000])
- Configuration: Use drop-in configs in ~/.config/pipewire/pipewire.conf.d/
- Matching: Use ~ for regex in rules (node.name = "~alsa_output.*")
- DSD Support: Include DSD formats: [ S16 S24 S24_32 S32 F32 F64 DSD_U8 DSD_U16 DSD_U32 DSD_U64 DSD_ULB DSD_UBY ]
- Dynamic Rate: Set `node.force-rate = 0`, `node.lock-rate = false`, `api.alsa.multi-rate = true` for dynamic rate switching

### Hardware-Specific Configuration
- Device: Fosi Audio DS2 with Cirrus Logic CS43131 DAC
- USB IDs: Vendor 0x262a (SAVITECH Corp.), Product 0x0001
- Sample Rates: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz supported
- Bit Depths: 16-bit (S16_LE), 24-bit (S24_3LE), 32-bit (S32_LE) supported
- DSD Support: Up to DSD256 with DoP (DSD over PCM) support
- Amplifier: Class H with adaptive power supply for efficiency
- Performance: 130 dB dynamic range, -115 dB THD+N (audiophile quality)
- Power: Bus Powered (100mA max from USB), with multi-rail supply (VL, VD, VA, VCP, VP) for noise isolation
- HV_EN Setting: Configurable high-voltage mode (2.6V/3.0V output) for different load requirements
- Output: Up to 2 Vrms stereo output, 30 mW per channel into 32Ω, 5 mW per channel into 600Ω
- Channels: 2-channel stereo (Front Left, Front Right)
- USB: Version 2.0 High Speed (480Mbps), with isochronous asynchronous endpoints and feedback synchronization
- Dynamic Rate: Device automatically switches to highest active stream rate (e.g., 44.1kHz→384kHz→44.1kHz when streams start/stop)
- Balanced vs Single-Ended: Balanced output offers superior performance with higher output voltage and better crosstalk

### General
- Indent with 2 spaces; no trailing commas
- Comments: Explain audiophile tweaks (e.g., # Low jitter for CS43131 DAC)
- Error Handling: Use set -e in scripts; nofail flags in modules for configs

## Cursor/Copilot Rules
None found (.cursor/rules/ empty; no .github/copilot-instructions.md). Follow above for AI edits.
