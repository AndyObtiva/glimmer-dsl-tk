# TODO

## General

- Fix issue with unbolding text in `text` widget when selecting multiple lines with an empty line
- Improve Hello, Text! (toolbar buttons: font, font size, bold, italic, underline, strikethrough, cut, copy, paste, insert image, find dialog, undo, redo)
- Set correct wrapping option for `text` widget by default (right now it breaks words across lines)
- Document all the new `text` formatting methods as well as Text Data-Binding
- Implement `code_text` custom widget using `text` and `rouge` gem
- Implement `code_text` line numbers feature, relying on yscrollcommand and yview scroll number
- Update Meta-Sample to use `code_text` custom widget
- Look into updating block_attribute expression to not require defining blocks that simply forward to tk on the widget
- Support grid keyword arg 'column_span' (with _) and 'row_span' as aliases for columnspan and rowspan

- Default to `validate 'all'` when defining `validatecommand {}` or `on('validate') {}` on an `entry`
- Support rgb colors via a hash of `:r`, `:g`, `:b`, hash of `:red`, `:green`, `:blue`, or `rgb(r, g, b)`
- Add default padding to `root`, `frame`, and `labelframe`

- Support themes
- Custom Widgets
- Support canvas shapes:
  - line
  - rectangle
  - oval
  - polygon
  - arc
  - image
  - text
  - widget
- Support canvas (composite) shape

## Samples

### Hello

- Hello, Scale!
- Hello, Progressbar!
- Hello, Menu Bar!
- Hello, Contextual Menu!
- Hello, Separator!
- Hello, Labelframe!
- Hello, Panedwindow!
- Hello, Grid!
- Hello, Dialog! (open_file, save_file, choose_directory, choose_color, font_chooser [choose_font alias])
- Hello, Toplevel! (Custom Window and Custom Dialog)
- Hello, Listbox! (two tabs for single/multi selection)
- Hello, Treeview!
- Hello, Table! (adapt treeview as a table)
- Hello, Scrollbar!
- Hello, Drag & Drop!
- Hello, Canvas!
- Hello, Canvas Drag and Drop!
- Hello, Cursor!
- Hello, Style!
- Hello, Theme!
- Hello samples for tk included tkextlib extra widgets such as tktable, calendar, autoscroll, tablelist, etc...

### Elaborate

- Elaborate, Login
- Elaborate, Tic Tac Toe
- Elaborate, Contact Manager
- Elaborate, Tetris
- Elaborate, Clock
- Elaborate, Game of Life
- Elaborate, Klondike Solitaire
- Elaborate, Battleship
- Elaborate, Mandelbrot Fractal
- Elaborate, Parking
- Elaborate, Stock Ticker
- Elaborate, Metronome
- Elaborate, Weather
- Elaborate, Calculator
- Elaborate, Timer

### External

- Gladiator (Glimmer Editor)
- Glimmer Klondike Solitaire

## Scaffolding

- Scaffold App without packaging
- Scaffold Custom Root Gem without packaging
- Scaffold Custom Widget Gem
- Scaffold Custom Widget in existing App
- Scaffold Custom Root in existing App

## Packaging

- Implement Packaging support for Mac
- Add Packaging support for Mac to Scaffolding
- Implement Packaging support for Windows
- Add Packaging support for Windows to Scaffolding
- Implement Packaging support for Linux
- Add Packaging support for Linux to Scaffolding

## Maybe

- Support `radiobuttons` widget that aggregates mutliple `radiobutton` widgets
- Support `checkbuttons` widget that aggregates mutliple `checkbutton` widgets
- Syntax adapter to become compatible with the syntax of Glimmer DSL for SWT, Glimmer DSL for LibUI and Glimmer DSL for Opal
- Logging library to ensure asynchronous logging (as opposed to Glimmer's built-in synchronous Logger)
- Support canvas shape nested relative positioning
- Think of a dynamic way of invoking commands on widgets instead of hardcoding commands for each widget
- Look into why text <Modified> event fires twice on every text change
- Support on_event listeners (as opposed to on('event')) (e.g. `on_KeyPress {}`)
