# Fosi Audio DS2 - USB Audio Descriptor Analysis

## Complete USB Descriptor Output

```
Bus 003 Device 008: ID 262a:0001 SAVITECH Corp. Fosi Audio DS2
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x262a SAVITECH Corp.
  idProduct          0x0001 Fosi Audio DS2
  bcdDevice            0.03
  iManufacturer           1 Speed Dragon
  iProduct                2 Fosi Audio DS2
  iSerial                 6 5000000001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0150
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval               6
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         1
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       0 [unknown]
      bFunctionProtocol      32 
      iFunction               3 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol     32 
      iInterface              3 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               2.00
        bCategory              10
        wTotalLength       0x0040
        bmControls           0x00
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID                1
        bmAttributes            7 Internal programmable clock (synchronized to SOF)
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource            0 
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bCSourceID              1
        bNrChannels             2
        bmChannelConfig    0x00000003
          Front Left (FL)
          Front Right (FR)
        iChannelNames           0 
        bmControls         0x0000
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0302 Headphones
        bAssocTerminal          0
        bSourceID              10
        bCSourceID              1
        bmControls         0x0000
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                10
        bSourceID               3
        bmaControls(0)     0x00000003
          Mute Control (read/write)
        bmaControls(1)     0x0000000c
          Volume Control (read/write)
        bmaControls(2)     0x0000000c
          Volume Control (read/write)
        iFeature                0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000003
          Front Left (FL)
          Front Right (FR)
        iChannelNames           0 
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            2
        bBitResolution         16
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c8  1x 200 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0002
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       2
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000003
          Front Left (FL)
          Front Right (FR)
        iChannelNames           0 
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            3
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x012c  1x 300 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0002
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       3
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000003
          Front Left (FL)
          Front Right (FR)
        iChannelNames           0 
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         32
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0190  1x 400 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0002
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       4
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bmControls           0x00
        bFormatType             1
        bmFormats          0x80000000
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames           0 
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         32
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0190  1x 400 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0002
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               4
```

## Key Technical Details

### Device Identification
- **Vendor ID**: 0x262a (SAVITECH Corp.)
- **Product ID**: 0x0001
- **Device Name**: Fosi Audio DS2
- **Manufacturer**: Speed Dragon
- **Serial Number**: 5000000001
- **USB Version**: 2.0
- **Speed**: High Speed (480Mbps)
- **Device Class**: 239 (Miscellaneous Device)
- **Protocol**: Interface Association

### Interface Configuration
The device implements 3 interfaces:
1. **Interface 0**: Human Interface Device (HID)
   - Used for device control and status
   - Single interrupt endpoint for status updates

2. **Interface 1**: Audio Control Device
   - Handles audio device control and configuration
   - Contains audio control descriptors defining the audio topology

3. **Interface 2**: Audio Streaming
   - Handles actual audio data streaming
   - Multiple alternate settings for different audio formats

### Audio Capabilities by Alternate Setting

#### Altset 1 (16-bit PCM)
- **Format**: PCM (S16_LE)
- **Bit Resolution**: 16-bit
- **Subslot Size**: 2 bytes
- **Channels**: 2 (Stereo)
- **Channel Map**: Front Left (FL), Front Right (FR)
- **Max Packet Size**: 200 bytes
- **Supported Rates**: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz

#### Altset 2 (24-bit PCM)
- **Format**: PCM (S24_3LE)
- **Bit Resolution**: 24-bit
- **Subslot Size**: 3 bytes
- **Channels**: 2 (Stereo)
- **Channel Map**: Front Left (FL), Front Right (FR)
- **Max Packet Size**: 300 bytes
- **Supported Rates**: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz

#### Altset 3 (32-bit PCM)
- **Format**: PCM (S32_LE)
- **Bit Resolution**: 32-bit
- **Subslot Size**: 4 bytes
- **Channels**: 2 (Stereo)
- **Channel Map**: Front Left (FL), Front Right (FR)
- **Max Packet Size**: 400 bytes
- **Supported Rates**: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz

#### Altset 4 (DSD)
- **Format**: SPECIAL (DSD)
- **Bit Resolution**: 32-bit
- **Subslot Size**: 4 bytes
- **Channels**: 2 (Stereo)
- **Max Packet Size**: 400 bytes
- **DSD Support**: Raw DSD with DOP=0, bitrev=0
- **Supported Rates**: 44.1k, 48k, 88.2k, 96k, 176.4k, 192k, 352.8k, 384k Hz

### Audio Topology
- **Clock Source**: ID 1, Internal programmable clock synchronized to SOF
- **Input Terminal**: ID 3, USB Streaming type (0x0101)
- **Output Terminal**: ID 4, Headphones type (0x0302)
- **Feature Unit**: ID 10, Provides mute and volume control for both channels
- **Channel Configuration**: 
  - Bit 0: Front Left (FL)
  - Bit 1: Front Right (FR)

### Endpoint Configuration
- **Data Endpoint**: 0x03 (EP 3 OUT), Isochronous, Asynchronous
- **Feedback Endpoint**: 0x84 (EP 4 IN), Isochronous, Feedback type
- **All alternate settings use the same endpoint configuration**
- **Feedback interval**: 4 (for clock synchronization)

### Power and Configuration
- **Power**: Bus Powered, 100mA max
- **Attributes**: Remote Wakeup support
- **Configuration Value**: 1
- **Total Interfaces**: 3
- **Total Length**: 0x0150 (336 bytes)

### Windows Driver Interface Mapping
Based on Windows Bravo-HD driver information (BvoHdUAC.inf and BvoHdCtl.inf):
- **MI_01**: Audio Streaming Interface (Interface 2) - handled by BvoHdUAC driver
- **MI_06**: Control Interface (likely Interface 0/1) - handled by BvoHdCtl driver
- The Windows driver explicitly recognizes `USB\VID_262A&PID_0001&MI_01` and `USB\VID_262A&PID_0001&MI_06` device strings

This comprehensive descriptor shows that the Fosi Audio DS2 is a high-quality USB audio device supporting up to 384kHz/32-bit PCM and DSD formats, with proper clock synchronization and feedback mechanisms for accurate timing. The device is also supported by dedicated Windows drivers that recognize the specific interface configurations.