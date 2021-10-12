# TODO

## General

- Support `root` attribute: `background` (try color `ssytemTransparent`)
- Support `root` attribute: `alpha`
- Support `root` attribute: `transparent`
- Support `root` attribute: `fullscreen`
- Support `root` attribute: `topmost`
- Support `root` attribute: `stackorder`
- Support `root` attribute: `winfo_screendepth`
- Support `root` attribute: `winfo_screenvisual`
- Support `root` attribute: `winfo_screenwidth`
- Support `root` attribute: `winfo_screenheight`
- Support `root` attribute: `winfo_pixels('li')`
- Support `root` attribute: `winfo_screen`
- Support `root` attribute: `wm_maxsize`
- Support `root` attribute: `state` (`'normal', 'iconic', 'withdrawn', 'icon', 'zoomed'`)
- Support `root` event binding: `on_delete_window` (alias: `on_close`)
- Support general `root` `attributes`
- Support `root` event binding: `on_open_window`

- Support rgb colors via a hash of `:r`, `:g`, `:b`, hash of `:red`, `:green`, `:blue`, or `rgb(r, g, b)`

- Support styles
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
- Implement `code_text` custom widget

## Samples

### Hello

- Hello, Frame!
- Hello, Root!
- Hello, Checkbox!
- Hello, Radiobutton!
- Hello, Entry!
- Hello, Grid!
- Hello, Text!
- Hello, Scale!
- Hello, Spinbox!
- Hello, Progressbar!
- Hello, Menu Bar!
- Hello, Contextual Menu!
- Hello, Dialog! (open_file, save_file, choose_directory, choose_color, font_chooser [choose_font alias])
- Hello, Toplevel! (Custom Window and Custom Dialog)
- Hello, Listbox! (two tabs for single/multi selection)
- Hello, Separator!
- Hello, Labelframe!
- Hello, Panedwindow!
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

- Elaborate, Meta-Sample
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

- Syntax adapter to become compatible with the syntax of Glimmer DSL for SWT, Glimmer DSL for LibUI and Glimmer DSL for Opal
- Logging library to ensure asynchronous logging (as opposed to Glimmer's built-in synchronous Logger)
- Support canvas shape nested relative positioning
