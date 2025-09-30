# Fosi Audio DS2 Hardware Details

## USB Device Information

- **Vendor ID**: 0x262a (SAVITECH Corp.)
- **Product ID**: 0x0001
- **Device Name**: Fosi Audio DS2
- **Manufacturer**: Speed Dragon
- **Serial Number**: 5000000001
- **USB Version**: 2.0
- **Speed**: High Speed (480Mbps)
- **Device Class**: 239 (Miscellaneous Device)
- **Protocol**: Interface Association
- **Configuration Value**: 1
- **Number of Interfaces**: 3
- **Power**: Bus Powered, 100mA max
- **Attributes**: Remote Wakeup support

## Audio Capabilities

### Supported Sample Rates
- 44.1 kHz
- 48 kHz
- 88.2 kHz
- 96 kHz
- 176.4 kHz
- 192 kHz
- 352.8 kHz
- 384 kHz

### Supported Bit Depths
- 16-bit (S16_LE)
- 24-bit (S24_3LE)
- 32-bit (S32_LE)
- DSD (Direct Stream Digital) support in SPECIAL format

### Audio Interfaces
- **Interface 0**: Human Interface Device
- **Interface 1**: Audio Control Device (Class 1, Subclass 1, Protocol 32)
- **Interface 2**: Audio Streaming (Class 1, Subclass 2, Protocol 32)

### Channel Configuration
- **Channels**: 2 (Stereo)
- **Channel Map**: Front Left (FL), Front Right (FR)
- **Terminal Type**: Headphones (0x0302)
- **Input Terminal Type**: USB Streaming (0x0101)

### Endpoint Details
- **Data Endpoint**: 0x03 (EP 3 OUT) - Isochronous, Asynchronous
- **Feedback Endpoint**: 0x84 (EP 4 IN) - For clock synchronization
- **Max Packet Sizes**:
  - 16-bit (Altset 1): 200 bytes
  - 24-bit (Altset 2): 300 bytes
  - 32-bit (Altset 3): 400 bytes
  - DSD (Altset 4): 400 bytes
- **Data Packet Interval**: 125 µs
- **Implicit Feedback Mode**: No

### Audio Processing
- **DAC**: Cirrus Logic CS43131 (based on documentation)
- **Amplifier**: Class H amplifier with adaptive power supply
- **Clock Source**: Internal programmable clock synchronized to SOF
- **Sample Formats**: PCM and DSD
- **Feature Unit**: Supports mute and volume control for both channels
- **Filter Types**: FORMAT_TYPE_I with various subslot sizes and bit resolutions

## PipeWire Integration
- **Node Name**: alsa_output.usb-Speed_Dragon_Fosi_Audio_DS2_5000000001-01.analog-stereo
- **Card Name**: Fosi Audio DS2
- **Driver**: snd_usb_audio
- **Sample Specification**: s32le 2ch (configurable up to 384kHz)
- **Channel Map**: front-left,front-right
- **Hardware Flags**: HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY

## USB Configuration
- **Configuration Value**: 1
- **Number of Interfaces**: 3
- **Power**: Bus Powered, 100mA max
- **Attributes**: Remote Wakeup support

## Windows Driver Support
The Fosi Audio DS2 is supported by the Bravo-HD USB Audio driver suite, which includes:

### BvoHdUAC.inf (USB Audio Class Driver)
- **Device Entry**: `USB\VID_262A&PID_0001&MI_01`
- **Interface**: Audio Streaming (MI_01)
- **Function**: Handles USB Audio Class compliant audio streaming
- **Class**: Audio, Subclass 2 (Streaming), Protocol 32

### BvoHdCtl.inf (Control Driver)
- **Device Entry**: `USB\VID_262A&PID_0001&MI_06`
- **Interface**: Control Interface (MI_06)
- **Function**: Provides device control and configuration
- **Class**: USB Interface Association with Audio function

### Driver Characteristics
- **Manufacturer**: SaviAudio (SAVITECH Corp.)
- **Device Recognition**: Uses standard USB Audio Class 2.0 protocol
- **Interface Association**: Properly identifies the audio streaming and control interfaces
- **Compatibility**: Supports Windows XP and later (NTX86, NTAMD64 architectures)
- **Driver Date**: 05/19/2023
- **Catalog Files**: BvoHdUAC.cat (x86), bvohda64.cat (x64), BvoHdCtl.cat (x86), BvHCtl64.cat (x64)

The Windows driver information confirms that the device follows USB Audio Class standards and provides both audio streaming (MI_01) and control (MI_06) interfaces, which aligns with the Linux ALSA snd_usb_audio driver recognition of the device.