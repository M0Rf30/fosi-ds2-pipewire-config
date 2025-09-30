# CS43131 130-dB, 32-Bit High-Performance DAC with Integrated Headphone Driver and Impedance Detection

## Overview

The CS43131 is a high-performance, 32-bit resolution, stereo audio DAC that supports up to 384-kHz sampling frequency with integrated low-noise ground-centered headphone amplifiers. The device features an advanced 32-bit oversampled multibit modulator with mismatch shaping technology that eliminates distortion due to on-chip component mismatch.

## Hardware Integration in Fosi Audio DS2

- **Device**: Cirrus Logic CS43131
- **USB Vendor ID**: 0x262a (SAVITECH Corp.)
- **USB Product ID**: 0x0001
- **Manufacturer**: Speed Dragon
- **Device Name**: Fosi Audio DS2
- **Serial Number**: 5000000001
- **USB Version**: 2.0, High Speed (480Mbps)
- **Supported Sample Rates**: 44.1 kHz, 48 kHz, 88.2 kHz, 96 kHz, 176.4 kHz, 192 kHz, 352.8 kHz, 384 kHz
- **Supported Bit Depths**: 16-bit (S16_LE), 24-bit (S24_3LE), 32-bit (S32_LE)
- **DSD Support**: Direct Stream Digital up to DSD256 with DoP (DSD over PCM) support
- **Channel Configuration**: 2-channel stereo (Front Left, Front Right)
- **Amplifier Type**: Class H with adaptive power supply
- **Terminal Type**: Headphones (0x0302)
- **Audio Interfaces**: 3 total (HID, Audio Control, Audio Streaming)
- **Endpoints**: Isochronous asynchronous with feedback synchronization
- **Max Output Power**: 30 mW per channel into 32 Ω, 5 mW per channel into 600 Ω
- **Dynamic Range**: 130 dB A-weighted
- **THD+N**: -115 dB
- **Output Voltage**: Up to 2 Vrms stereo output
- **Power Source**: Bus Powered (100mA max from USB)
- **Power Architecture**: Multi-rail supply (VL, VD, VA, VCP, VP) with separate analog/digital rails
- **HV_EN Setting**: Configurable high-voltage mode (2.6V/3.0V output) for different load requirements
- **Efficiency**: Class H adaptive power supply for maximum efficiency from limited USB power

## Key Features

### System Features
- **Enhanced ΔΣ oversampling DAC architecture**
  - 32-bit resolution
  - Up to 384-kHz sampling rate
  - Low clock jitter sensitivity
  - Auto mute detection
- **Integrated high performance, ground-centered stereo headphone outputs**
  - 130-dB dynamic range (A-weighted)
  - –115-dB total harmonic distortion + noise (THD+N)
  - 110-dB interchannel isolation
  - Up to 2-Vrms stereo output
  - Headphone power output
    - 30 mW per channel into 32 Ω
    - 5 mW per channel into 600 Ω
- **Headphone detection**
  - Headphone DC and AC impedance measurement
  - Headphone plug-in detection
  - Popguard® technology eliminates pop noise
- **Integrated PLL**
  - Support for 11.2896-/22.5792-, 12.288-/24.576-, 9.6-/19.2-, 12-/24-, and 13-/26-MHz system MCLK rates
  - Reference clock sourced from XTI/MCLK pin
  - System clock output
- **Direct Stream Digital (DSD®) path**
  - Up to 256•Fs DSD
  - Patented DSD processor
    - On-chip 50-kHz filter to meet Scarlet Book Super Audio Compact Disk (SACD) recommendations
    - Matched PCM and DSD analog output levels
    - Nondecimating volume control with 0.5-dB step size and soft ramp
    - DSD and Pulse-code modulation (PCM) mixing for alerts
  - Dedicated DSD and DoP pin interface
- **Serial audio input path**
  - Programmable Hi-Fi digital filter
  - Five selectable digital filter responses
    - Low-latency Mode minimizes pre-echo
    - 110 dB of stopband attenuation
  - Supports sample rates from 32 to 384 kHz
  - I2S, right-justified, left-justified, TDM, and DSD-over-PCM (DoP) interface
  - Master or slave operation
  - Volume control with 0.5-dB step size and soft ramp
  - 44.1 kHz deemphasis and inverting feature
- **Additional features**
  - Alternate headphone input
  - Mono Mode (differential) support
  - I2C control—up to 1 MHz
  - Wideband Flatness Mode Support
  - 40-pin 5mm × 5mm QFN or 42-ball CSP package options

## Applications

- Smart phones, tablets, portable media players, laptops
- Digital headphones, powered speakers, AVR, home theater systems
- Blu-ray/DVD/SACD players, and pro audio

## Pin Assignments and Descriptions

### 40-Pin QFN Package (Top-Down View)

The device is available in a 40-pin QFN package with the following pin assignments:

**Power Supply Pins:**
- VL (Logic Power, typically +1.8V)
- VD (Internal Digital Power, typically +1.8V)
- VA (Analog Power)
- VCP (Charge Pump Supply)
- VP (Battery supply)

**Digital I/O:**
- SCLK1, LRCK1, SDIN1 (Serial audio input)
- DSDCLK/SCLK2, DSDB/LRCK2, DSDA/SDIN2 (DSD interface)
- SDA, SCL (I2C interface)
- ADR (I2C Address)
- RESET (System Reset)
- INT (Interrupt output)
- CLKOUT (Clock Output)
- XTI/MCLK, XTO (Crystal interface)

**Analog I/O:**
- HPOUTA, HPOUTB (Headphone outputs)
- HPINA, HPINB (Alternate headphone inputs)
- HPREFA, HPREFB (Headphone output reference)
- HP_DETECT (Headphone detection)

**Ground and Charge Pump:**
- GNDD, GNDA, GNDCP (Ground connections)
- FILT+, FILT- (Positive/Negative voltage reference)
- –VA, FLYP_VA, FLYN_VA (Charge pump connections)
- VCP_FILT+, VCP_FILT- (Inverting charge pump filter connections)
- FLYP_VCP, FLYC_VCP, FLYN_VCP (Charge pump connections)

### 42-Ball WLCSP Package

The device is also available in a 42-ball Wafer Level Chip Scale Package (WLCSP) with similar pin functionality.

## Specifications

### Absolute Maximum Ratings
- Analog supply (VA): –0.3 to 2.33 V
- Battery supply (VP): –0.3 to 6.3 V
- Charge pump (VCP): –0.3 to 2.33 V
- Digital supplies (VL, VD): –0.3 to 2.33 V
- Storage temperature: –65°C to +150°C

### Recommended Operating Conditions
- Analog supply (VA): 1.66 to 1.94 V
- Battery supply (VP): 3.0 to 5.25 V (HV_EN = 0), 3.3 to 5.25 V (HV_EN = 1)
- Digital supplies (VL, VD): 1.66 to 1.94 V
- Operating temperature: –20°C to +70°C

### Analog Output Characteristics (HV_EN = 1)
- Dynamic range: 130 dB (A-weighted) for 24/32-bit PCM and DSD
- THD+N: –109 to –115 dB at 0 dB
- Idle channel noise: 0.55 µV (A-weighted)
- Full-scale output voltage: 4.90 Vpp (RL = 10 kΩ), 4.90 Vpp (RL = 600 Ω), 2.81 Vpp (RL = 32 Ω)
- Output power: 5 mW (RL = 600 Ω), 30.8 mW (RL = 32 Ω)
- Interchannel isolation: 120 dB at 1 kHz

### Analog Output Characteristics (HV_EN = 0)
- Dynamic range: 128 dB (A-weighted) for 24/32-bit PCM and DSD
- THD+N: –107 to –113 dB at 0 dB
- Full-scale output voltage: 3.96 Vpp (RL = 10 kΩ), 2.81 Vpp (RL = 32 Ω), 1.41 Vpp (RL = 16 Ω)
- Output power: 15.6 mW (RL = 16 Ω)

### Digital Interface Specifications
- I2C clock frequency: Up to 1 MHz
- Logic levels: 0.3•VL to 0.7•VL for input thresholds
- Input leakage current: ±3 to ±4 µA for digital inputs

### PLL Characteristics
- Output frequency: 22.5792 to 24.576 MHz
- Lock time: 620 to 1000 µs
- Supported reference clocks: 11.2896, 22.5792, 12.288, 24.576, 9.6, 19.2, 12, 24, 13, 26 MHz

### Crystal Characteristics
- Supported frequencies: 22.5792 MHz and 24.576 MHz
- Load capacitance: 5 to 8 pF
- Equivalent series resistance: Up to 100 Ω
- Startup time: Up to 6.5 ms

## Functional Description

### Analog Outputs

The analog output block includes separate pseudo-differential headphone Class H amplifiers output. An on-chip inverting charge pump creates a positive and negative voltage equal to the input, allowing an adaptable, full-scale output swing centered around ground. The resulting internal amplifier supply can be ±VCP, or ±VP_LDO (either ±3.0 V with HV_EN = 1 or ±2.6 V with HV_EN = 0).

The inverting architecture eliminates the need for large DC-blocking capacitors and allows the amplifier to deliver more power to HP loads at lower supply voltages. This adaptive power supply scheme converts traditional Class AB amplifiers into more power-efficient Class H amplifiers.

### Class H Amplifier Output

The CS43131 headphone output amplifiers use Cirrus Logic two-mode Class H technology. This technology maximizes operating efficiency of the typical Class AB amplifier while maintaining high performance. In a Class H amplifier design, the rail voltages supplied to the amplifier vary with the needs of the music passage that is being amplified. This prevents unnecessarily wasting energy during low power passages of program material or when the program material is played back at a low volume level.

The internal charge pump, which creates the rail voltages for the headphone amplifiers, is the central component of the two-mode Class H technology implemented in the CS43131. The charge pump receives its input voltage from the voltage present on the VCP or VP pin. From this input voltage, the charge pump creates the differential rail voltages supplied to the amplifier output stages.

HV_EN setting determines the VP_LDO voltage:
- HV_EN = 0: VP_LDO voltage is 2.6 V
- HV_EN = 1: VP_LDO voltage is 3.0 V

HV_EN = 1 setting is required to support the 1.7-V full-scale voltage for a 600-Ω load and above. In this setting, minimum VP is required to be higher than 3.3 V, and any load below 600 Ω is not supported. When HV_EN = 0, the max output voltage is 1.4-V RMS full-scale voltage.

### Power Supply Control Options

The device supports two types of operation: standard Class AB and adapt-to-output signal. The set of rail voltages supplied to the amplifier output stages depends on the ADPT_PWR setting:

- **Standard Class AB Operation (ADPT_PWR = 001 or 010)**: The rail voltages supplied to the amplifiers are held to ±VP_LDO or ±VCP, respectively. The rail voltages supplied to the output stages are held constant, regardless of the output signal level.

- **Adapt-to-Output Signal (ADPT_PWR = 111)**: The rail voltage sent to the amplifiers is based solely on whether the signal sent to the amplifiers would cause the amplifiers to clip when operating on the lower set of rail voltages at certain threshold values.

### Wideband Flatness Mode

The CS43131 specifically optimizes for wideband flatness playback, which is enabled by PCM_WBF_EN bit. This mode should only be enabled when PCM plays back at 192 kHz. When operating in other speeds or modes, this bit should be properly disabled.

### DSD Interface

The CS43131 has a dedicated DSD interface to support up to a 256•Fs DSD stream. The DSD interface shares pins with the XSP. The DSD processor uses a decimation-free DSD processing technique that allows for features such as matched PCM level output, DSD volume control, and 50-kHz on-chip filter.

### Audio Serial Port (ASP)

The ASP supports both PCM and DoP stream playback. It can be configured to support common audio interfaces including TDM/I2S and left-justified (LJ). The serial port can operate as either the master of timing or as a slave to another device's timing.

### Filtering Options

For PCM/TDM mode, the following interpolation filtering options can be selected:
- Fast roll-off and slow roll-off interpolation filter options
- In each option above, both low-latency and normal phase-compensation filtering options can be used
- Nonoversampling (NOS) mode is provided, which minimizes the internal digital processing

### Headphone Detection

The CS43131 provides headphone presence-detect and load-detection functionalities. It can detect the presence or absence of a plug through the HP_DETECT sense pin. The presence detect function is accomplished by having a small current source inside the CS43131 to pull up the pin if it is left floating (no plug).

### Headphone Impedance Measurement

The CS43131 can measure the impedance of headphone DC load in the range of 20 Hz to 20 kHz. The measurement process involves applying a slowly ramping voltage to the headphone load and measuring the resulting resistance.

## Applications

### Power Sequencing

For power-up sequencing:
- VP must be powered up first
- All other supplies can come up in any order before RESET is released

For power-down sequencing:
- After RESET is asserted, VA/VCP/VL/VD can be removed in any order
- VP must be powered down last

### Crystal Tuning

The CS43131 uses an external crystal as the source for internal MCLK. Supported crystals include:
- River Electronics FCX-06-22.5792J51933 (22.5792 MHz)
- River Electronics FCX-06-24.5760J51930 (24.576 MHz)
- NDK NX2016SA 22.5792M EXS00A-CS09116 (22.5792 MHz)
- TXC 8Y22570001 (22.5792 MHz)

## Register Descriptions

The device provides comprehensive register control for all features including:
- Global registers for system control
- PLL registers for clock generation
- ASP and XSP registers for audio serial ports
- DSD registers for Direct Stream Digital processing
- Headphone and PCM registers for audio control
- Interrupt status and mask registers

## Package Options

The CS43131 is available in:
- 40-pin 5mm × 5mm QFN package
- 42-ball WLCSP package

## Summary

The CS43131 is a high-performance stereo audio DAC that combines excellent audio performance with integrated headphone amplifiers, making it ideal for portable audio applications. Its advanced features include 32-bit resolution, support for up to 384-kHz sampling rates, integrated DSD processing, headphone detection and impedance measurement, and Class H amplifier technology for improved efficiency. The device provides excellent dynamic range (130 dB A-weighted) and low distortion (–115 dB THD+N), making it suitable for high-end audio applications.