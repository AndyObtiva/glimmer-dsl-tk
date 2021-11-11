# Change Log

## 0.0.39

- Add Language and Language Name menus to Hello, Menu Bar! sample
- Update Hello, Button! sample to indicate compound option value on image text buttons
- Support Mac `menu_item(:about, label: ) { on('command') {} }`
- Support Mac `menu_item(:preferences) { on('command') {} }`
- Support Mac `menu_item(:help) { on('command') {} }`
- Support Mac `menu_item(:quit) { on('command') {} }`
- Support Mac `'Help'` and `'Window'` menus


## 0.0.38

- Hello, Menu Bar! sample
- Support `menu` and `menu_item` widgets including `:command` (default), `:separator`, `:radiobutton`, and `:checkbutton` styles
- Support menu item `accelerator` attribute
- Support menu item `selection` attribute
- Support menu item `state` attribute
- Support menu item command event, which is triggered on mouse/keyboard menu item selection or via accelerator
- Support `toplevel` `iconphoto` (more conveniently via direct path) and `resizable` attributes

## 0.0.37

- Support `focus: true` or `focus: [integer]` option for all selection formatting methods (`add_selection_format`, `remove_selection_format`, `toggle_selection_format`, `add_selection_font_format`, `remove_selection_font_format`, `toggle_selection_font_format`)
- Have `text` widget grab focus after every formatting modification in Hello, Text! (e.g. after clicking `B` for Bold)

## 0.0.36

- Hello, Toplevel! (Custom Window and Custom Dialog)
- Support `mac_style` attribute under `toplevel`
- Support registering multiple general event listeners on widgets (previously, later event listener registrations replaced former ones)
- Support `escapable true` property under `root` and `toplevel` to close on hitting ESCAPE button

## 0.0.35

- Improved Meta-Sample by utilizing Ruby from `RbConfig.ruby`
- Improved girb_runner.rb to be more platform independent
- Fixed `text` widget binding of standard bind events (e.g. `'KeyPress'` or `'ButtonPress'`)
- Fixed Hello, Text! issue with not being able to bring up Find Dialog once all text is deleted and new text is entered
- Fixed undo/redo issue

## 0.0.34

- When applying a `text` selection format without having a selection, have it apply to current insert mark word
- Support registering multiple general event listeners on `text` widget (previously, later event listener registrations replaced former ones)
- Implement `:no_selection_default` option of `:insert_word`, `insert_letter`, or `none` for `text` selection formatting methods (`add_selection_format`, `remove_selection_format`, `toggle_selection_format`, `add_selection_font_format`, `remove_selection_font_format`, `toggle_selection_font_format`)
- Make sure to only allow `text` undo/redo when there are changes to be undoed/redoed
- Fix issue with Hello, Text! Find Dialog not coming up with keyboard shortcut (e.g. CMD+F) anymore
- Fix issue with Hello, Text! whereby after applying background, and foreground to a selection, you cannot apply bold, italic, or underline for the same selection (or font-size or font-family)

## 0.0.33

- Support `text` widget `InsertMarkMoved` listener event to track insert mark movement (or aliases `InsertMarkMove`, `insert_mark_move`, `insert_mark_moved`, all case-insensitive)
- Support `entry` widget `changed` and `modified` listener event aliases for `change` event
- Autodiscover format options when moving cursor in `text` widget (auto-derive from applied tags and widget font) and show in top Hello, Text! toolbar comboboxes and buttons
- Fix issue with encountering error 'NoMethodError: undefined method "size" for' when launching Hello, Text!, performing Select-All (CMD+A or CONTROL+A) and then attempting to Bold all the text.
- Fix issue in Hello, Text! whereby bolding a small region of text affects the font of the following region of text till the end of the document
- Fix issue in Hello, Text! where if all text is copied and then pasted multiple times, the `text` widget loses its keyboard/mouse listeners and CMD+F does not work anymore to bring Find dialog

## 0.0.32

- Hello, Text! Find Dialog toolbar button
- Hello, Text! Find Dialog Windows/Linux CONTROL+F shortcut alternative to Mac CMD+F

## 0.0.31

- Improve Hello, Text! (toolbar buttons: justify left, justify center, justify right)
- `on('destroy') {|widget| ...}` support in widgets to better track calls to "destroy" method and `'<Destroy>'` binding event (as opposed to the unreliable tracking of '<Destroy>' alone)
- Support observing `text` general events (e.g. `'<KeyPress>'`) through `on(event) {}` (was not working before because it required applying a tag, a general `__all__` tag is applied automatically now on full range (`1.0` to `end`))
- Ensure unregistering observers (like data-binding observers) when destroying a widget
- Add `Glimmer::Tk::ToplevelProxy` widget proxy support similar to `Glimmer::Tk::RootProxy`

## 0.0.30

- Improve Hello, Text! (toolbar buttons: find dialog)
- Fixed Hello, Built-in Dialog! Font Dialog issue
## 0.0.29

- Hello, Built-in Dialog! (demonstrating all built-in dialogs like get_open_file and choose_color)
- Hello, Separator!
- Improve Hello, Text! (toolbar buttons: insert image)
- Removed unnecessary `text` widget `text` attribute after realizing `value` does the same thing
- Support `text` widget data-binding on 'modified' event and use in Hello, Text!
- Support `text#insert_image(text_index, *image_args)`
- Support `text#get_open_file_to_insert_image(text_index = 'insert')` shortcut for doing both `get_open_file` and `insert_image` in one shot
- Support built-in dialogs: `get_open_file(options = nil)`, `get_multiple_open_file(options = nil)`, `get_save_file(options = nil)`, `get_multiple_save_file(options = nil)`, `choose_directory(options = nil)`, `choose_color(options = nil)`, `choose_font(initial_font_args) {|font| do_something_with_font(font) }`
- Support built-in dialog aliases: `open_file`, `multiple_open_file`, `save_file`
- Enhance `get_open_file`/`get_multiple_open_file` `filetypes` support to take a real Ruby hash instead of `['{Image Files} {.png}']`
- Support `grid` keyword arg `'column_span'` (with _) and `'row_span'` as aliases for `'columnspan'` and `'rowspan'`

## 0.0.28

- Hello, Drag and Drop!
- Improve Hello, Text! (toolbar buttons: font family, font size, cut, copy, paste, undo, redo)
- Drag & Drop support
- Update default dimensions of Meta-Sample root window to 1280x720
- Have any widget with a `font` attribute (like `text`) support pre-defined fonts like `'caption'` and `'heading'` (just like `label`)

## 0.0.27

- Improve Hello, Text! (toolbar buttons: bold, italic, underline)
- Set correct `wrap 'word'` attribute for `text` widget in Hello, Text!
- Default `text` widget to `wrap = 'none'`
- Default `text` widget to `font = {family: 'Courier New'}`
- Fix issue with unbolding text in `text` widget when selecting multiple lines with an empty line

## 0.0.26

- Ensure spinbox data-binding updates on text key changes (without incrementing/decrementing)
- Optimize `text=` attribute setter on `text` widget when setting a text value that includes all previous text by having it not delete and reinsert, yet append instead.
- Support font attribute for arbitrary fonts with terse syntax (`font 'times 12 bold'` not `font TkFont.new('times 12 bold')`)
- Support a quicker way of tagging (instead of the two-step process of tagging with a keyword and then configuring the keyword style) (e.g. `text.tag(5.0, 6.0, :background=>'yellow', :font=>'TkFixedFont', :relief=>'raised')`)
- Support styles (via `style` keyword or with attribute defaulting to style when not available) and ability to define and apply a style in one shot
- Support `TextProxy#toggle_format` (+ `TextProxy#add_format` & `TextProxy#remove_format`) to be able to toggle a tag format option on or off for `text` widget in one shot instead of having to apply a tag and then configure a tag format
- Hello, Text! (a word processor with a toolbar having foreground color and background color)

## 0.0.25

- Elaborate, Meta-Sample
- Hello, Spinbox!
- Support `spinbox` `command {}` and `on('increment') {}` / `on('decrement') {}`
- Support `spinbox` `format` attribute (e.g. `format '%0.2f'`
- Make `grid sticky: 'nsew', column_weight: 1` the default for all widgets (column weight is only applied to the first widget in a series of siblings)
- Support `text` widget with `text` attribute/data-binding just like `entry`
- Set `background '#ececec' if OS.mac?` on `root` by default
- Support `'modified'`/`'selected'` event bindings for `text` widget

## 0.0.24

- Hello, Entry!
- Update `entry` data-binding logic to trace 'write' changes to `entry` `textvariable` as that is more correct than monitoring `validatecommand`
- Support `entry` `validate`  (alias for `validatecommand`), `invalid` (alias for `invalidcommand`), and `change` event bindings
- Support `entry` `show` and `validate` attributes
- Support `grid` options `row_weight` (for row expansion), `column_weight` (for column expansion), `row_minsize` (alias: `min_height`), and `column_minsize` (alias: `min_width`)

## 0.0.23

- Hello, Radiobutton!
- Support `radiobutton` ensuring that sibling radio buttons share the same variable to achieve mutually exclusive selection
- Improved Hello, Checkbutton! sample to demonstrate alternate checkbutton value (half-checked state)
- Support `checkbutton` with specified `onvalue` and `offvalue` (when they do not have values 1 and 0)
- Alias `root` `title` attribute as `text` & add children attribute to widgets
- Alias `notebook` `frame` `:title` as `:text`
- Alias message_box `:title` as `:text`
- Fix reference to `Glimmer::Tk::CheckbuttonProxy` (was `Glimmer::Tk::ChecktbuttonProxy`)

## 0.0.22

- Hello, Checkbutton!
- Support checkbutton data-binding

## 0.0.21

- Support event bindings via `on(event) {}` syntax nestable under any widget
- Support `root` event binding: `'WM_DELETE_WINDOW'` and alias `'DELETE_WINDOW'`
- Support `root` event binding: `'OPEN_WINDOW'`
- Support `root` attribute: `background` (any color including `systemTransparent`)
- Support `root` boolean attribute: `alpha`
- Support `root` boolean attributes: `fullscreen`, `topmost`, `transparent`
- Support `root` attributes: `stackorder`, `winfo_screendepth`, `winfo_screenvisual`, `winfo_screenwidth`, `winfo_screenheight`, `winfo_pixels('li')`, `winfo_screen`, `wm_maxsize`
- Support `root` attribute: `state` (`'normal', 'iconic', 'withdrawn', 'icon', 'zoomed'`)

## 0.0.20

- Hello, Root! sample
- Support `root` `width`, `height`, `x`, `y` attributes
- Support `root` attribute: `resizable`
- Support `root` attribute: `minsize`
- Support `root` attribute: `maxsize`
- Set minimum width/height on `root` (190 pixels)

## 0.0.18

- Hello, Frame! sample
- Avoid setting grid geometry manager on `toplevel` widget
- Support `frame` `width` and `height` attributes
- Support `frame` `borderwidth` attribute
- Support `frame` `relief` attribute
- Support `frame` `padding` attribute
- Rename Hello, Tab! to Hello, Notebook!

## 0.0.17

- Hello, Label! sample
- Support `label` `anchor` attribute (`'e'`, `'se'`, `'s'`, `'sw'`, `'w'`, `'nw'` or `'center'`)
- Support `label` `width` attributes
- Support `label` `image` attribute
- Support `label` `justify` attribute (`'left', 'center', 'right'`)
- Support `label` `font` attribute (`'default', 'text', 'fixed', 'menu', 'heading', 'caption', 'small_caption', 'icon', 'tooltip'`)
- Support `label` `foreground` attribute
- Support `label` `background` attribute (note that it does not work in Mac 'aqua' theme)
- Support `label` `compound` attribute
- Support `label` `relief` attributes (`'flat' (default), 'raised', 'sunken', 'solid', 'ridge', 'groove'`)

## 0.0.16

- Support common themed widget state attributes: `active`, `disabled`, `focus`, `pressed`, `selected`, `background`, `readonly`, `alternate`, `invalid`, and `hover`
- Update Hello, Button! to utilize `focus true` in first button.

## 0.0.15

- Update Hello, Button! to demo all button attributes
- Support `button` `image` attribute (accepting image arguments: `subsample`, `zoom`, `from`, `to`, `shrink`, `compositingrule` to automatically process image)
- Update `root` `iconphoto` support to accept image arguments: `subsample`, `zoom`, `from`, `to`, `shrink`, `compositingrule` to automatically process image
- Support `button` `compound` attribute (`'center', 'top', 'bottom', 'left', 'right'`)
- Support `button` `default` attribute (`'active'` or `'normal'`)

## 0.0.14

- Hello, Button!

## 0.0.13

- Hello, Message Box!
- Support `message_box`

## 0.0.12

- Upgrade to glimmer 2.3.0
- Support Shine syntax for data-binding
- Update all data-binding samples to use Shine syntax for data-binding

## 0.0.11

- Add preliminary support for `treeview` (no data-binding) with `columns`, `show`, and `heading_configure` attributes/methods

## 0.0.10

- puts_debuggerer gem to help consumers with debugging in and out of girb

## 0.0.9

- Upgrade to glimmer 2.1.2

## 0.0.8

- Fix issue #5 (https://github.com/AndyObtiva/glimmer-dsl-tk/issues/5)
- Support `iconphoto` attribute on `root` widget, intelligently accepting a direct image path or `TkPhotoImage` object
- Set `root` `iconphoto` attribute to Glimmer icon by default if not set in an application.
- Provide `iconphoto` code example in README
- Upgrade to glimmer 2.1.1

## 0.0.7

- Upgraded to tk 0.4.0
- Fixed `girb` by changing to a pure Ruby script

## 0.0.6

- Upgraded to tk 0.3.0

## 0.0.5

- Label text data-binding
- Entry text data-binding
- The `grid` geometry manager
- Hello, Computed! sample

## 0.0.4

- `list` custom widget (since listbox is not tile themed yet in Tk)
- `girb` (Glimmer IRB)
- Hello, List Single Selection! sample
- Hello, List Multi Selection! sample

## 0.0.3

- Combobox support
- Button command event observer support
- Combobox text data-binding
- Hello, Combo! sample

## 0.0.2

- Notebook/frame support
- Hello, Tab! sample

## 0.0.1

- Initial Glimmer DSL for TK implementation to support Hello, World!
