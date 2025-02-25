# Milestones

## Blinking light
To check we can run Rust in Teensy.

Note:
- NOT raw avrdude code & image
- rather: library called from Arduino IDE
    - safer
    - maybe also easier on Windows? who knows

### WIP
- [x] via raw avrdude/stuff
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
    - [x] do the same but over USB HID, simulating a keyboard
        - [x] use C++ code from Teensyduino
        - [x] USB key send on switch press
            - <https://forum.pjrc.com/index.php?threads/keyboard-press-doesnt-like-it-when-i-feed-it-a-string.71874/#post-318669>
            - <https://www.pjrc.com/teensy/td_keyboard.html> 
        - [x] another USB key send on switch release
        - `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/hardware/avr/1.59.0/cores/usb_serial_hid/usb.c` 
        - `C:/Users/Mateusz/AppData/Local/Arduino15/packages/teensy/hardware/avr/1.59.0/cores/teensy/pins_teensy.c`
            - [ ] maybe `rust-bindgen`?
                - <https://rust-lang.github.io/rust-bindgen/cpp.html#constructor-semantics> ?
                - [ ] concerns: <https://cxx.rs/context.html#c-vs-c>
            - [ ] ✖ ~~maybe <https://docs.rs/autocxx> ?~~
                - probably not possible b/c autocxx is (?) wrapper over cxx
            - [x] ✖ ~~maybe <https://cxx.rs> ?~~
                - seems impossible due to its apparent dependency on `std` (through `foldhash`) 
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
- [ ] debouncing
- [ ] LATER: layer(s)
- [ ] LATER: main LED
- [ ] LATER: more LEDs
- [ ] LATER: simplify the USB code - leave only what I need
    - [ ] ideally, esp. drop the need for setting `F_CPU`
    - [ ] allow providing keycodes from Rust rather than from C
    - [ ] LATER: try to make it fit in the API expected by `avr_hal`
- [ ] LATER LATER: easily configurable dynamically

## Mouse

## Wireless
- BLE?
- Battery-powered?
    - 2xAAA accumulator ? (or even 1xAAA ?)
        - "DC-to-DC boost converter" ?
     
## Asides
- <https://docs.rs/ufmt>
- [ ] cleanup the `build.rs` script
- [ ] move C & CPP code to some separate directory in the project tree
- [ ] slap AGPL headers on source files
- [ ] fix README
- [ ] Arduino "serial monitor protocol" wrapper for use with Teensy serial monitor handler
    - [ ] intercept and capture `teensy-monitor.exe` inputs issued by Arduino IDE
        - should in theory match: <https://github.com/arduino/pluggable-monitor-protocol-handler/blob/main/monitor.go>
    - [ ] implement a wrapper for easy viewing of serial output of Teensy