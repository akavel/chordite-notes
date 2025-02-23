# Milestones

## Blinking light
To check we can run Rust in Teensy.

Note:
- NOT raw avrdude code & image
- rather: library called from Arduino IDE
    - safer
    - maybe also easier on Windows? who knows

### WIP
- 🚀 via raw avrdude/stuff
    - `C:\Users\Mateusz\AppData\Local\Arduino15\packages\teensy\tools\teensy-compile\11.3.1\avr\bin\avr-gcc`
    - <https://github.com/Rahix/avr-hal>
    - [x] serial output & serial monitor
        - [x] a) embed Teensy C code via FFI
            - [x] 🎉 try `usb_debug_only.c` from Teensy C "blinky" example
    - [x] detect a pressed switch from a pullup pin
        - [x] set pin as pullup
            - `PB0` 
        - [x] read it in loop
        - [x] if pressed, quickly toggle LED with much shorter delay
    - [x] when key pressed, send character to serial output
        - [x] wrap unsafe usb write code in a helper func
        - [x] do not send again until key released
            - [x] keep state
    - [ ] do the same but over USB HID, simulating a keyboard
        - [ ] use C code from Teensyduino
        - `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/hardware/avr/1.59.0/cores/usb_serial_hid/usb.c` 
        - `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/hardware/avr/1.59.0/cores/teensy/pins_teensy.c`
    - [ ] LATER: run `cargo doc --features <your-mcu> --open` in <https://rahix.github.io/avr-hal/atmega_hal/index.html> crate's dir
    - Note: `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/tools/teensy-compile/11.3.1/avr/lib/gcc/avr/7.3.0/device-specs/` 


## Chordite…
Actual keyboard stuff.
- USB HID
- Keyboard (use `#include <Keyboard.h>`?)

### WIP
- [ ] ABSTRACTED Rust implementation
    - (non-avr, "pure" rust with stubs/callbacks)
    - unit tests

## Mouse

## Wireless
- BLE?
- Battery-powered?
    - 2xAAA accumulator ? (or even 1xAAA ?)
        - "DC-to-DC boost converter" ?
     
## Asides
- <https://docs.rs/ufmt>