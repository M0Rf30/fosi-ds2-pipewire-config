# Fosi Audio DS2 Dynamic Sample Rate Switching Configuration

This configuration enables automatic sample rate switching for the Fosi Audio DS2 (Speed Dragon) device. The device will automatically adapt to the highest sample rate among all active audio streams.

## Features

- **Automatic Rate Switching**: The device automatically switches to the highest sample rate of active streams
- **Dynamic Adaptation**: When multiple streams are playing at different rates (e.g., 44.1kHz, 96kHz, 384kHz), the device will set itself to the highest rate (384kHz in this example)
- **Rate Scaling Down**: When higher-rate streams stop, the device automatically scales down to the next highest active rate
- **High-Resolution Audio Support**: Supports up to 384kHz/32-bit PCM and DSD formats as per CS43131 specifications

## How It Works

The configuration implements dynamic sample rate switching through:

1. **PipeWire Configuration (`pipewire.conf`)**:
   - Sets `node.force-rate = 0` to allow dynamic rate changes
   - Sets `node.lock-rate = false` to prevent rate locking
   - Enables `api.alsa.multi-rate = true` for multi-rate support
   - Configures allowed rates: [44100, 48000, 96000, 176400, 192000, 352800, 384000]

2. **WirePlumber Configuration (`wireplumber.conf`)**:
   - Configures device settings with dynamic rate support
   - Sets `audio.rate = 0` to allow automatic rate selection
   - Enables multi-rate support for all profiles and ports

## Configuration Files

### `pipewire.conf`
- Node rules match the Fosi DS2 device by name pattern
- Stream rules enable dynamic rate adaptation
- Factory profiles support multi-rate operation

### `wireplumber.conf`
- Route profiles support dynamic rate switching
- Device settings enable multi-rate support
- Node settings allow rate changes
- Stream properties support rate adaptation

## Example Scenarios

1. **Multiple Streams at Different Rates**:
   - Stream 1: 44.1kHz → Device sets to 44.1kHz
   - Stream 2 starts at 96kHz → Device automatically switches to 96kHz
   - Stream 3 starts at 384kHz → Device automatically switches to 384kHz
   - Stream 3 stops → Device automatically switches back to 96kHz
   - Stream 2 stops → Device automatically switches back to 44.1kHz

2. **Single Stream**:
   - Stream at 192kHz → Device sets to 192kHz
   - Stream stops → Device returns to default rate

## Testing

To test the configuration:

1. Play audio at a lower sample rate:
   ```bash
   paplay -r 44100 -b 16 --device=alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo test_441.wav
   ```

2. Play audio at a higher sample rate simultaneously:
   ```bash
   paplay -r 192000 -b 32 --device=alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo test_192.wav
   ```

3. Check the device status to see if the rate changed:
   ```bash
   wpctl status
   ```

## Troubleshooting

- If the device doesn't switch rates, ensure no other application is locking the sample rate
- Check that `pipewire` and `wireplumber` services are running
- Verify that your media files match the intended sample rates
- Restart PipeWire services after configuration changes:
  ```bash
  systemctl --user restart pipewire pipewire-pulse wireplumber
  ```

## Hardware Compatibility

This configuration is specifically optimized for:
- **Fosi Audio DS2** with CS43131 DAC chip
- USB ID: `Speed_Dragon_Fosi_Audio_DS2_5000000001-01`
- Supports up to 384kHz/32-bit PCM and DSD formats
- Features Class H amplifier optimization