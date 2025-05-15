# ZMK Corne Keyboard Configuration

## Overview

This document provides a comprehensive explanation of my ZMK configuration for the Corne keyboard. The layout is optimized for developer workflows with integration for macOS, Yabai window manager, Vim, and Tmux.

The configuration features:

- 5 layers with intuitive organization
- Home row mods for efficient modifier access
- Smart shift behavior with caps-word support
- Integrated macros for Vim and Tmux
- Custom keycodes for Yabai window management

## Keyboard Layout

The Corne is a 42-key split keyboard with the following physical layout:

```
┌───┬───┬───┬───┬───┬───┐   ┌───┬───┬───┬───┬───┬───┐
│   │   │   │   │   │   │   │   │   │   │   │   │   │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│   │   │   │   │   │   │   │   │   │   │   │   │   │
├───┼───┼───┼───┼───┼───┤   ├───┼───┼───┼───┼───┼───┤
│   │   │   │   │   │   │   │   │   │   │   │   │   │
└───┴───┴───┼───┼───┼───┤   ├───┼───┼───┼───┴───┴───┘
            │   │   │   │   │   │   │   │
            └───┴───┴───┘   └───┴───┴───┘
```

## Layer 0: Base QWERTY Layer

The base layer uses QWERTY with optimized placement of essential keys.

```
┌─────┬─────┬─────┬─────┬─────┬─────┐   ┌─────┬─────┬─────┬─────┬─────┬─────┐
│ TAB │  Q  │  W  │  E  │  R  │  T  │   │  Y  │  U  │  I  │  O  │  P  │  #  │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│ ESC │A/CMD│S/ALT│D/CTL│  F  │  G  │   │  H  │  J  │K/CTL│L/ALT│'/CMD│  \  │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│`/ED │  Z  │  X  │  C  │  V  │  B  │   │  N  │  M  │  ,  │  .  │  ;  │//MA │
└─────┴─────┴─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┴─────┴─────┘
                  │ SYM │BKSPC│SHIFT│   │ENTER│SPACE│ FUN │
                  └─────┴─────┴─────┘   └─────┴─────┴─────┘
```

### Key Features:

- **Home Row Mods**:
  - Left: A (⌘), S (⌥), D (⌃)
  - Right: K (⌃), L (⌥), ' (⌘)
- **Special behaviors**:
  - Smart Shift: Tap for sticky shift, double-tap for caps-word, hold for shift
  - Backspace/Delete: Tap for backspace, shift+tap for delete
  - Hash (#) tap dance: Single tap for #, double tap for ###
- **Layer access**:
  - ED (Editor) layer: Hold ` (grave)
  - MA (System) layer: Hold / (slash)
  - SY (Symbols) layer: Hold left thumb
  - FN (Function) layer: Hold right thumb

## Layer 1: Symbols and Numbers Layer

This layer provides access to numbers and all symbols, organized in a logical pattern.

```
┌─────┬─────┬─────┬─────┬─────┬─────┐   ┌─────┬─────┬─────┬─────┬─────┬─────┐
│  ~  │  1  │  2  │  3  │  4  │  5  │   │  6  │  7  │  8  │  9  │  0  │ DEL │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│  `  │  !  │  @  │  #  │  $  │  %  │   │  ^  │  &  │  *  │  +  │  -  │     │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│     │  -  │  =  │  [  │  {  │  (  │   │  )  │  }  │  ]  │  =  │  _  │     │
└─────┴─────┴─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┴─────┴─────┘
                  │     │     │     │   │     │ FUN │     │
                  └─────┴─────┴─────┘   └─────┴─────┴─────┘
```

### Key Features:

- Numbers 0-9 on the top row
- Essential symbols organized by frequency of use
- Matching brackets/parentheses next to each other
- Quick access to mathematical operators
- All symbols formerly available via combos now directly accessible

## Layer 2: Function and Media Layer

This layer provides access to function keys, media controls, and navigation.

```
┌─────┬─────┬─────┬─────┬─────┬─────┐   ┌─────┬─────┬─────┬─────┬─────┬─────┐
│ F1  │ F2  │ F3  │ F4  │ F5  │ F6  │   │ F7  │ F8  │ F9  │ F10 │ F11 │ F12 │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│MUTE │VOL- │VOL+ │PREV │PLAY │NEXT │   │ ←   │ ↓   │ ↑   │ →   │  /  │  ?  │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│     │BRI- │BRI+ │KILL │FULL │BAL  │   │YAB← │YAB↓ │YAB↑ │YAB→ │  ,  │  .  │
└─────┴─────┴─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┴─────┴─────┘
                  │     │     │     │   │     │     │     │
                  └─────┴─────┴─────┘   └─────┴─────┴─────┘
```

### Key Features:

- Function keys F1-F12 across the top row
- Media controls on left middle row
- Standard navigation arrows on right middle row
- Brightness controls on bottom left
- Yabai window management controls:
  - KILL = Shift+Alt+D: Close the current window
  - FULL = Shift+Alt+F: Toggle fullscreen for current window
  - BAL = Shift+Alt+B: Balance window layout (equalize sizes)
  - YAB← = Alt+H: Focus window to the left
  - YAB↓ = Alt+J: Focus window below
  - YAB↑ = Alt+K: Focus window above
  - YAB→ = Alt+L: Focus window to the right

## Layer 3: Editor Layer

This layer is specialized for coding and text editing with Vim and Tmux integration.

```
┌─────┬─────┬─────┬─────┬─────┬─────┐   ┌─────┬─────┬─────┬─────┬─────┬─────┐
│⌘+S  │⌃+S  │⌃+W  │⌃+E  │⌃+R  │VIM:ZZ│   │TMUX:─│TMUX:n│TMUX:p│TMUX:f│TMUX:v│⌥⌃⏎  │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│⌘+A  │⇧⌥S  │⇧⌥D  │⌘+D  │⌘+F  │VIM:VS│   │TMUX:|│⇧⌘[  │⇧⌘]  │⌃+G  │⌘+P  │⌘+⏎  │
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│     │⌘+Z  │⌘+X  │⌘+C  │⌘+V  │⌃+O  │   │VIM:w │YASP1│YASP2│YASP3│VIM:wq│     │
└─────┴─────┴─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┴─────┴─────┘
                  │     │     │     │   │     │ FUN │     │
                  └─────┴─────┴─────┘   └─────┴─────┴─────┘
```

### Key Features:

- Common editor commands on the left side
- Vim macros:
  - VIM:ZZ = Shift+Z: Save and quit
  - VIM:VS = Shift+V: Visual selection
  - VIM:w = :w⏎: Save current file
  - VIM:wq = :wq⏎: Save and quit
- Tmux controls (all use Ctrl+A prefix):
  - TMUX:─ = Split horizontally
  - TMUX:| = Split vertically
  - TMUX:n = Next window
  - TMUX:p = Previous window
  - TMUX:f = Session finder
  - TMUX:v = Copy mode
- Yabai workspace switching:
  - YASP1 = Shift+Alt+1: Switch to space 1 (terminal)
  - YASP2 = Shift+Alt+2: Switch to space 2 (browser-work)
  - YASP3 = Shift+Alt+3: Switch to space 3 (slack)

## Layer 4: System and Bluetooth Layer

This layer handles system controls, Bluetooth management, and application switching.

```
┌─────┬─────┬─────┬─────┬─────┬─────┐   ┌─────┬─────┬─────┬─────┬─────┬─────┐
│OUT  │BT 0 │BT 1 │BT 2 │BT 3 │BT 4 │   │⌘+1  │⌘+2  │⌘+3  │⌘+4  │⌘+5  │POWER│
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│RESET│BT←  │BT→  │BTCLR│⇧⌥G  │⇧⌥T  │   │⌘+6  │⌘+7  │⌘+8  │⌘+9  │⌘+0  │RESET│
├─────┼─────┼─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┼─────┼─────┤
│     │⇧⌘Z  │HYPER│ MEH │⌃+V  │⌃+B  │   │⌘+-  │⌃TAB │⇧⌃TAB│⌘+=  │⌘+W  │     │
└─────┴─────┴─────┼─────┼─────┼─────┤   ├─────┼─────┼─────┼─────┴─────┴─────┘
                  │     │CAPS │     │   │     │     │     │
                  └─────┴─────┴─────┘   └─────┴─────┴─────┘
```

### Key Features:

- Bluetooth controls on top left:
  - OUT = Toggle USB/BLE output
  - BT 0-4 = Select Bluetooth profile
  - BT← / BT→ = Cycle between profiles
  - BTCLR = Clear paired devices
- App switching shortcuts (⌘+1 through ⌘+0)
- Reset controls in corners
- Special modifier combinations:
  - HYPER = Ctrl+Shift+Alt+Cmd (super-modifier)
  - MEH = Ctrl+Shift+Alt
- Tab navigation with Ctrl+Tab and Shift+Ctrl+Tab
- Zoom controls with ⌘+ and ⌘-
- Capslock access

## Special Behaviors

### Home Row Mods

The configuration implements "home row mods" - modifier keys on the home row that activate when held and type letters when tapped:

```
Left hand:  A(⌘) S(⌥) D(⌃)
Right hand: K(⌃) L(⌥) '(⌘)
```

These use cross-hand activation to prevent accidental triggering. The behavior is configured with:

- `tapping-term-ms = <280>`: Time to determine tap vs hold
- `quick-tap-ms = <175>`: Window for quick repeated taps
- `require-prior-idle-ms = <150>`: Required idle time before registering a hold

### Smart Shift

Smart shift provides three functionalities in one key:

- Tap: Sticky shift (next key is uppercase)
- Double-tap: Caps-word (typing in all caps until space/punctuation)
- Hold: Standard shift modifier

### Backspace/Delete

The backspace key supports two operations:

- Tap or hold: Backspace
- Shift+tap or Shift+hold: Delete

## Macros

### Vim Macros

- `VIM_SAVE`: Types `:w<Enter>` to save current file
- `VIM_SAVE_QUIT`: Types `:wq<Enter>` to save and quit
- `VIM_SPLIT_HORZ`: Sends Ctrl+W then S to split horizontally
- `VIM_SPLIT_VERT`: Sends Ctrl+W then V to split vertically

### Tmux Macros

All tmux macros start with Ctrl+A (the tmux prefix), then:

- `TMUX_HSPLIT`: Sends `-` to create horizontal split
- `TMUX_VSPLIT`: Sends `|` to create vertical split
- `TMUX_NEXT`: Sends `n` to go to next window
- `TMUX_PREV`: Sends `p` to go to previous window
- `TMUX_SESS`: Sends `f` to open session finder
- `TMUX_COPY`: Sends `v` to enter copy mode

## Yabai Integration

The layout integrates with yabai window manager through dedicated keybindings:

- Window focusing: Alt+H/J/K/L
- Window management: Shift+Alt+D/F/B
- Space switching: Shift+Alt+1/2/3

## Bluetooth Configuration

- Supports 5 Bluetooth profiles (BT 0-4)
- Includes profile cycling (BT_PRV, BT_NXT)
- Clear pairing with BT_CLR
- Toggle between USB and Bluetooth with OUT_TOG
- Configured for secure pairing with passkey

## Power Management

- Sleep timeout set to 30 minutes
- Enhanced Bluetooth TX power
- Battery level reporting for split halves

---

This configuration is designed to be intuitive while providing access to all necessary functions without relying on combo keys. The layer organization follows logical groupings with related functionality placed together for easier memorization.
