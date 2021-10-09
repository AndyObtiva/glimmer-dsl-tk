# Change Log

## 0.0.13

- Hello, Button!
- Support `button` `image` attribute (accepting image arguments: `subsample`, `zoom`, `from`, `to`, `shrink`, `compositingrule` to automatically process image)

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
