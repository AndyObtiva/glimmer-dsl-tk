# Change Log

## 0.0.29

- Improve Hello, Text! (toolbar buttons: insert image)
- Removed unnecessary `text` widget `text` attribute after realizing `value` does the same thing
- Support `text` widget data-binding on 'modified' event and use in Hello, Text!
- Support `text#insert_image(text_index, *image_args)`
- Support built-in dialogs: `get_open_file(options = nil)`, `get_multiple_open_file(options = nil)`, `get_save_file(options = nil)`, `get_multiple_save_file(options = nil)`, `choose_directory(options = nil)`, `choose_color(options = nil)`, `choose_font(initial_font_args) {|font| do_something_with_font(font) }`
- Support built-in dialog aliases: `open_file`, `multiple_open_file`, `save_file`, `multiple_save_file`
- Enhance `::Tk::getOpenFile` `filetypes` support to take a real Ruby hash instead of `['{Image Files} {.png}']`
- Support `text#get_open_file_to_insert_image(text_index = 'insert')` shortcut for doing both `get_open_file` and `insert_image` in one shot

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
