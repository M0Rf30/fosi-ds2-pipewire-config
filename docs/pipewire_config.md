# PipeWire Configuration for Fosi Audio DS2

## Device Information
- **Device Name**: Fosi Audio DS2
- **Vendor**: Speed Dragon (SAVITECH Corp.)
- **Product ID**: 0x0001
- **Vendor ID**: 0x262a
- **Serial**: 5000000001
- **Sample Rates**: 44100, 48000, 88200, 96000, 176400, 192000, 352800, 384000 Hz
- **Bit Depths**: 16, 24, 32 bits
- **Channels**: 2 (Stereo)
- **DSD Support**: Yes (up to DSD256)

## PipeWire Configuration

### Default Clock Settings
- **Default Rate**: 48000 Hz (for compatibility)
- **Allowed Rates**: [44100 48000 96000 176400 192000 352800 384000] (for audiophile use)
- **Min Quantum**: 32 (for low latency)
- **Max Quantum**: 1024
- **Quantum**: 256 (default for balanced performance)

### Device-Specific Configuration
- **Node Name Pattern**: alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_*
- **Channel Map**: FL,FR (Front Left, Front Right)
- **Formats**: [S16 S24 S24_32 S32 F32 F64 DSD_U8 DSD_U16 DSD_U32 DSD_U64 DSD_ULB DSD_UBY]
- **Buffer Settings**: Adaptive for optimal performance

## Configuration Files

### ~/.config/pipewire/pipewire.conf.d/50-fosi-ds2.conf
```
context.properties = {
  default.clock.rate = 48000
  # Audiophile rates: 176400, 192000, 352800, 384000
  default.clock.allowed-rates = [44100 48000 96000 176400 192000 352800 384000]
  default.clock.min-quantum = 32
  default.clock.max-quantum = 1024
  default.clock.quantum = 256
  # Low jitter for CS43131 DAC
  default.clock.quantum-limit = 8192
}

# Module to load device-specific configuration
context.modules = [
  { name = "libpipewire-module-rtkit" }
  { name = "libpipewire-module-protocol-native" }
  { name = "libpipewire-module-adapter" }
  { name = "libpipewire-module-device" }
  { name = "libpipewire-module-client-node" }
  { name = "libpipewire-module-spa-device" }
  { name = "libpipewire-module-spa-node-factory" }
  { name = "libpipewire-module-metadata" }
  { name = "libpipewire-module-link-factory" }
  { name = "libpipewire-module-session-manager" }
]

# Node rules for Fosi DS2
node.rules = [
  {
    # Fosi DS2 device configuration
    matches = [
      {
        # Match Fosi DS2 by name
        node.name = "~alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2.*"
      }
    ]
    actions = {
      update-props = {
        # Enable all supported formats including DSD
        audio.format = [S16 S24 S24_32 S32 F32 F64 DSD_U8 DSD_U16 DSD_U32 DSD_U64 DSD_ULB DSD_UBY]
        # Set to maximum supported rate for audiophile use
        audio.rate = 384000
        # Stereo channels
        audio.channels = 2
        # Channel map
        audio.position = [FL FR]
        # Low latency settings
        node.latency = "32/384000"
        # Priority settings
        priority.driver = 1109
        priority.session = 1109
        # Enable all supported rates
        param = [
          {
            name = "Enum:format"
            value = [S16 S24 S24_32 S32 F32 F64 DSD_U8 DSD_U16 DSD_U32 DSD_U64 DSD_ULB DSD_UBY]
          }
          {
            name = "Enum:rate"
            value = [44100 48000 96000 176400 192000 352800 384000]
          }
        ]
      }
    }
  }
]
```

### ~/.config/wireplumber/wireplumber.conf.d/50-fosi-ds2.conf
```
# Fosi DS2 specific routing and policy configuration
route-profiles = {
  "alsa_card.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01" = {
    profiles = {
      "analog-stereo" = {
        description = "Stereo analogico"
        priority = 9900
        available = "yes"
        devices = 1
        # Enable all supported rates
        params = {
          rate = [44100 48000 96000 176400 192000 352800 384000]
          channels = 2
          format = [S16 S24 S24_32 S32 F32 F64 DSD_U8 DSD_U16 DSD_U32 DSD_U64 DSD_ULB DSD_UBY]
        }
      }
    }
    ports = {
      "analog-output" = {
        direction = "Output"
        priority = 9900
        available = "yes"
        profiles = ["analog-stereo"]
      }
    }
  }
}

# Device settings for Fosi DS2
device-settings = {
  rules = [
    {
      matches = [
        {
          "device.name" = "~alsa_card.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01"
        }
      ]
      apply = {
        "api.alsa.use-acp" = true
        "api.alsa.card" = 1
        "device.profile.name" = "analog-stereo"
        # Enable high-resolution audio support
        "audio.format" = "S32"
        "audio.rate" = 384000
        "audio.channels" = 2
        "audio.position" = [FL FR]
      }
    }
  ]
}

# Node settings for Fosi DS2
node-settings = {
  rules = [
    {
      matches = [
        {
          "node.name" = "~alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo"
        }
      ]
      apply = {
        # Enable all supported formats
        "audio.format" = [S16 S24 S24_32 S32 F32 F64 DSD_U8 DSD_U16 DSD_U32 DSD_U64 DSD_ULB DSD_UBY]
        # Set to maximum sample rate for audiophile use
        "audio.rate" = 384000
        # Low latency settings
        "node.latency" = "32/384000"
        # Priority settings
        "priority.driver" = 1109
        "priority.session" = 1109
      }
    }
  ]
}
```

## Usage Notes

1. The Fosi DS2 supports up to 384kHz sample rates and 32-bit audio, which are configured in the above files
2. DSD support is enabled through the DSD_U* formats in the configuration
3. The device has excellent performance at high sample rates as confirmed by the hardware capabilities
4. For best performance, use the balanced output when available
5. The Class H amplifier provides efficient power delivery with low heat generation

## Testing Configuration

After applying the configuration:

1. Restart PipeWire: `pkill -f pipewire && pipewire & pipewire-pulse &`
2. Verify device detection: `pw-cli ls Node | grep -i fosi`
3. Test high-resolution audio: `paplay --device="alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo" --rate=384000 --format=S32LE test_file.wav`
4. Monitor with: `pw-top` or `pw-dump > state.json`

## Troubleshooting

- If the device doesn't appear at high sample rates, check that your test file matches the supported format
- Verify that the device is not being limited by the source application
- Check `cat /proc/asound/card1/stream0` (adjust card number) to confirm hardware capabilities are being utilized
