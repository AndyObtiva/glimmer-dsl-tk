# TODO

## Next

- Mac Preferences menu item
- Mac Quit menu item
- Mac Help menu
- Mac Window menu
- Other Mac Menu Handlers (https://tcl.tk/man/tcl8.6/TkCmd/tk_mac.htm):
```
`tk::mac::ShowPreferences:` Called when the "Preferences..." menu item is selected.
`tk::mac::ShowHelp:` Called to display main online help for the application.
`tk::mac::Quit:` Called when the Quit menu item is selected, when a user is trying to shut down the system etc.
`tk::mac::OnHide:` Called when your application has been hidden.
`tk::mac::OnShow:` Called when your application is shown after being hidden.
`tk::mac::OpenApplication:` Called when your application is first opened.
`tk::mac::ReopenApplication:` Called when a user "reopens" your already-running application (e.g. clicks on it in the Dock)
`tk::mac::OpenDocument:` Called when the Finder wants the application to open one or more documents (e.g. that were dropped on it). The procedure is passed a list of pathnames of files to be opened.
`tk::mac::PrintDocument:` As with OpenDocument, but the documents should be printed rather than opened.
```
- Windows System menu
- X11 (Linux) Help menu

## Soon

- Hello, Contextual Menu!
- Enhance `text` undo/redo to include format/font-format changes
- `text` widget cut/copy with style (perhaps track all applied formatting tags and reapply them to new indexes)
- `text` widget paste with cut/copied style (perhaps track all applied formatting tags and reapply them to new indexes)
- `text` widget paste matching insert mark style (track all applied tags to that location and reapply)

- `icon_photo` as alias for `iconphoto` attribute
- Add defensive programming for preventing spinbox from allowing value to go over `to` (max) when typing by keyboard
- Allow setting root x/y without affecting its default width/height
- Look into updating block_attribute expression to not require defining blocks that simply forward to tk on the widget
- Document Glimmer debug logging
- Refactor `WidgetProxy` by adding a `griddable?` method that could be overriden by subclasses to consult for auto-gridding on `initialize_defaults`

## General

- Implement `code_text` custom widget using `text` and `rouge` gem
- Implement `code_text` line numbers feature, relying on yscrollcommand and yview scroll number
- Update Meta-Sample to use `code_text` custom widget

- Auto-Default to `validate 'key'` when defining `validatecommand {}` or `on('validate') {}` on an `entry`
- Support rgb colors via a hash of `:r`, `:g`, `:b`, hash of `:red`, `:green`, `:blue`, or `rgb(r, g, b)`
- Add default padding to `labelframe`
- Hello, Labelframe!

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

- Package native executable for Mac
- Package native executable for Windows
- Package native executable for Linux

## Samples

### Hello

- Hello, Scale!
- Hello, Progressbar!
- Hello, Panedwindow!
- Hello, Grid!
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

## Issues

- Fix issue with `on('KeyPress')`/`on('KeyRelease')` not firing on `text` widget arrow key presses after deleting all text and typing new text (it fires on mouse clicks and typing new text)

## Maybe

- Support `radiobuttons` widget that aggregates mutliple `radiobutton` widgets
- Support `checkbuttons` widget that aggregates mutliple `checkbutton` widgets
- Syntax adapter to become compatible with the syntax of Glimmer DSL for SWT, Glimmer DSL for LibUI and Glimmer DSL for Opal
- Logging library to ensure asynchronous logging (as opposed to Glimmer's built-in synchronous Logger)
- Support canvas shape nested relative positioning
- Think of a dynamic way of invoking commands on widgets instead of hardcoding commands for each widget
- Look into why text <Modified> event fires twice on every text change
- Support on_event listeners (as opposed to on('event')) (e.g. `on_KeyPress {}`)
- Consider switching drag and drop extension to an included a module
- Consider generalizing support for drag and drop to fire on any mouse button and indicate the clicked mouse button in the event
- `text` widget selection data-binding (relying on `tag_ranges 'sel'` and on `tag_add 'sel', 5.0, 6.0`)
- Support `validate_command` and `invalid_command` as aliases to `validatecommand` and `invalidcommand` on `entry`
- Provide a convenience `#modifiers` method on KeyPress/KeyRelease event that provides an English-description of held modifiers (e.g. `['shift_l', 'meta_l']`) as that would be more convenient than reliance on `event.state` cryptic integer values
- Support installing multiple event listeners on any widget (tk by default supports installing one event listener only, with subsequent installations overriding previous ones)
