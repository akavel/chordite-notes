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
    - [x] create project with `cargo-generate`, for one of supported boards with atmega32u4
        - [x] Leonardo was chosen
    - [x] build the Leonardo project to get a hex file for Leonardo
    - [x] switch to a non-`arduino_hal` type of project, based on `examples/atmega2560`, but keep using `atmega32u4` instead
    - [x] on Teensy, how pin 11 (A10) of the Teensy board maps to atmega32u4 microcontroller's registers/memory/thigs (pin?)
        - seemingly it should be: **PD6**
    - [x] blinky! on raw `atmega32u4`
    - [x] how to acces `PD6` atmega32u4 pin in Rust?
    - [ ] 🔔 serial output & serial monitor
        - challenge: USB apparently "alpha grade" on avr-hal + atmega32u4
            - <https://github.com/Rahix/avr-hal/issues/40> - overview of the situation
            - <https://github.com/Rahix/avr-hal/pull/572> - some PR to maybe take a look at; in some areas looks somewhat messy
            - <https://github.com/agausmann/atmega-usbd> - other related experimental development
            - 🤔 <https://github.com/mogenson/atmega32u4-usb-serial> - Teensy C bindings; but will this allow future keyboard support? how about inspiring how to do wrapper/bindings?
        - [ ] 🚀 a) embed Teensy C code via FFI
            - [x] try <https://github.com/mogenson/atmega32u4-usb-serial> - Teensy C bindings
                - didn't work with `hid_listen.exe` :/
                    - could be many things - either misconfig, or other bug, or just Vendor ID or smth not recognized by `hid_listen.exe`.
            - [x] 🎉 try `usb_debug_only.c` from Teensy C "blinky" example
            - [ ] try to simplify them down to just use C code for now as much as possible
            - [ ] try upgrading to newer USB serial library from Teensyduino
            - `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/hardware/avr/1.59.0/cores/usb_serial_hid/usb.c` 
            - `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/hardware/avr/1.59.0/cores/teensy/pins_teensy.c`
        - [ ] b) embed Rust code as precompiled binary in Arduino IDE project/sketch
            - <https://arduino.github.io/arduino-cli/1.1/library-specification/#precompiled-binaries> 
    - [ ] (maybe: `winget install AVRDudes.AVRDUDE ZakKemble.avr-gcc`)
    - [ ] LATER: run `cargo doc --features <your-mcu> --open` in <https://rahix.github.io/avr-hal/atmega_hal/index.html> crate's dir
    - [ ] LATER: should I use `arduino-hal` crate with `arduino-leonardo` feature? (it uses `atmega32u4`)
    - Note: `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/tools/teensy-compile/11.3.1/avr/lib/gcc/avr/7.3.0/device-specs/` 
- via QEMU + raw avrdude/stuff
    - <https://qemu-project.gitlab.io/qemu/system/target-avr.html>
- via Arduino IDE ?
    - [ ] <https://arduino.github.io/arduino-cli/1.1/library-specification/#precompiled-binaries>
    - [x] find the project with Rust library callable from Arduino IDE
        - <https://github.com/simondlevy/ArduRust32> (just it's for STM32) 
    - [ ] make it build for Atmega32U4
    - [ ] make it work with Teensy (2.0 - this seems builtin) support in Arduino IDE
        - [ ] make project in Arduino IDE
        - [ ] ...


## Chordite…
Actual keyboard stuff.
- USB HID
- Keyboard (use `#include <Keyboard.h>`?)

### WIP
- [ ] ABSTRACTED Rust implementation
    - (non-avr, "pure" rust with stubs/callbacks)
    - unit tests 