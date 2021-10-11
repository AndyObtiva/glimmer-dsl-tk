# Change Log

## 0.0.17

- Support `label` `anchor` attribute (`'e'`, `'se'`, `'s'`, `'sw'`, `'w'`, `'nw'` or `'center'`)
- Support `label` `width` attributes
- Support `label` `image` attribute
- Support `label` `justify` attribute (`:left`, `:center`, `:right`)
- Support `label` `font` attribute (`:default`, `:text`, `:fixed`, `:menu`, `:heading`, `:caption`, `:small_caption`, `:icon`, `:tooltip`)
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
