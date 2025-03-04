# Milestones

## S1 - USB on Teensy2
To check we can run Rust in Teensy.
- <file:///C:/prog/avr-hal/target/doc/atmega_hal/index.html>
- `C:\Users\Mateusz\AppData\Local\Arduino15\packages\teensy`
- <https://github.com/Rahix/avr-hal>
- <https://www.pjrc.com/teensy/td_keyboard.html> 

## 🚀 Chordite…
Actual keyboard stuff.
- USB HID
- Keyboard (use `#include <Keyboard.h>`?)

### Thoughts
- IN: current state of 8 switches, as a byte (`u8`)
- OUT: either `(key, modifiers)`, or `nothing`
- STATE: "most" switches (`u8`)
- CONFIG:
    - Layout "look-up table": map `u8` -> either `(key, modifiers)` OR...
        - 256 entries ??
        - ~68 entires in the "old" chordite firmware cheatsheet I tried
            - [ ] <https://docs.rs/heapless/latest/heapless/struct.LinearMap.html> ?
- LATER:
    - SoA for `no_std` ?
        - port `soa_rs`? 

### WIP
- [ ] ABSTRACTED Rust implementation
    - (non-avr, "pure" rust with stubs/callbacks)
    - unit tests
    - [x] Layers
        - [x] test for redefined keys
    - [x] modifier for some keys on a layer
    - [x] "default" action on a layer
    - [x] CTRL
        - [x] test
    - [ ] 🔔 🚀 integrate with `chordite_rust` to try on real hardware!
        - [ ] try generic-izing stuff:
            - [x] `lookup()`
                - [x] Trait?
                - [ ] FnMut?
            - [x] `KeyWithFlags` in `UsbOutcome`
            - [ ] LATER: `SwitchSet(u8)`
        - [ ] 🔔 🚀 try integrating
            - [x] test if the new usb function works
            - [x] fixme: publish no_usb const_map to github (fork) & open PR
            - [x] import chordite-chords
            - [x] instantiate Chordite with sample_layers
            - [x] try using Chordite::handle() and passing the result to the new usb function
            - [x] debounce
                - <https://crates.io/crates/debouncr> ? 
            - [ ] fixup the `path = ...` dependency in `Cargo.toml`
    - [x] right_alt (`ALTGR_MASK`) - for Polish letters
    - [x] bug:
        - [x] `SHIFT, R-ALT, E` -> gives capital `E`, should give capital `Ę`
    - [ ] **missing!**
        - [ ] `%`
        - [ ] `#`
        - [ ] CapsLock
        - [ ] Insert
        - [ ] F1-F12 function keys
        - [ ] PrintScreen
    - [ ] layout redesign?
    - [ ] Tests
    - [ ] layout config outsourced to the importer of Chordite type
        - [ ] prob'ly through a Trait
- [ ] LATER: main LED
- [ ] LATER: more LEDs
- [ ] LATER: simplify the USB code - leave only what I need
    - [ ] ideally, esp. drop the need for setting `F_CPU`
    - [ ] allow providing keycodes from Rust rather than from C
    - [ ] LATER: try to make it fit in the API expected by `avr_hal`
    - [ ] <https://github.com/xoac/static-bytes> ?
- [ ] LATER LATER: easily configurable dynamically
    - [ ] <https://crates.io/crates/miniconf> ?
    - [ ] <https://crates.io/crates/unicode-width> ?

## Mouse
- <https://github.com/NeoBirth/accelerometer.rs>
- <https://crates.io/crates/dcmimu>

## Wireless
- BLE?
- Battery-powered?
    - 2xAAA accumulator ? (or even 1xAAA ?)
        - "DC-to-DC boost converter" ?
     
## Asides & Experiments
- <https://docs.rs/ufmt>
- [ ] cleanup the `build.rs` script
- [ ] cleanup: move C & CPP code to some separate directory in the project tree
- [ ] slap AGPL headers on source files
- [ ] fix README
- [ ] Arduino "serial monitor protocol" wrapper for use with Teensy serial monitor handler
    - [ ] intercept and capture `teensy-monitor.exe` inputs issued by Arduino IDE
        - should in theory match: <https://github.com/arduino/pluggable-monitor-protocol-handler/blob/main/monitor.go>
    - [ ] implement a wrapper for easy viewing of serial output of Teensy
- [ ] for KeyWithFlags, impl/derive Debug trait, for nice debugging to serial port
- [ ] make KeyWithFlags be an enum
- [ ] can I merge chordite-rust + chordite-chords into single cargo workspace?
- [ ] try going to newer rust
    - [ ] edition2024
    - [ ] new nightly at or after edition2024