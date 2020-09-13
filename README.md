# [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=85 />](https://github.com/AndyObtiva/glimmer) Glimmer DSL for Tk 0.0.3 (Desktop GUI)
[![Gem Version](https://badge.fury.io/rb/glimmer-dsl-tk.svg)](http://badge.fury.io/rb/glimmer-dsl-tk)
[![Travis CI](https://travis-ci.com/AndyObtiva/glimmer-dsl-tk.svg?branch=master)](https://travis-ci.com/github/AndyObtiva/glimmer-dsl-tk)
[![Coverage Status](https://coveralls.io/repos/github/AndyObtiva/glimmer-dsl-tk/badge.svg?branch=master)](https://coveralls.io/github/AndyObtiva/glimmer-dsl-tk?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/ce2853efdbecf6ebdc73/maintainability)](https://codeclimate.com/github/AndyObtiva/glimmer-dsl-tk/maintainability)
[![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Glimmer](https://github.com/AndyObtiva/glimmer) DSL for [Tk](https://www.tcl.tk/) enables desktop development with [Glimmer](https://github.com/AndyObtiva/glimmer) in [Ruby](https://github.com/ruby/ruby).

[Tcl/Tk](https://www.tcl.tk/) has evolved into a practical desktop GUI toolkit due to gaining true native widgets on Mac, Windows, and Linux in [Tk version 8.5](https://www.tcl.tk/software/tcltk/8.5.html#:~:text=Highlights%20of%20Tk%208.5&text=Font%20rendering%3A%20Now%20uses%20anti,and%20window%20layout%2C%20and%20more.).

Additionally, [Ruby](https://www.ruby-lang.org/en/) 3.0 Ractor (formerly known as [Guilds](https://olivierlacan.com/posts/concurrency-in-ruby-3-with-guilds/)) supports truly parallel multi-threading, making both [MRI](https://github.com/ruby/ruby) and [Tk](https://www.tcl.tk/) finally viable for support in [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library) as an alternative to [JRuby on SWT](https://github.com/AndyObtiva/glimmer-dsl-swt).

The trade-off is that while [SWT](https://www.eclipse.org/swt/) provides a plethora of high quality reusable widgets for the Enterprise (such as [Nebula](https://www.eclipse.org/nebula/)), [Tk](https://www.tcl.tk/) enables very fast app startup time via [MRI Ruby](https://www.ruby-lang.org/en/).

[Glimmer](https://github.com/AndyObtiva/glimmer) provides a DSL to enable more productive desktop development in Ruby with:
- Declarative DSL syntax that visually maps to the GUI widget hierarchy
- Convention over configuration via smart defaults and automation of low-level details
- Requiring the least amount of syntax possible to build GUI
- Bidirectional Data-Binding to declaratively wire and automatically synchronize GUI with Business Models
- Scaffolding for new custom widgets, apps, and gems
- Native-Executable packaging on Mac, Windows, and Linux
- Custom Widget support

**Hello, World!**

Glimmer code (from [samples/hello/hello_world.rb](samples/hello/hello_world.rb)):

```ruby
root {
  label {
    text 'Hello, World!'
  }
}.open
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_world.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello world](images/glimmer-dsl-tk-screenshot-sample-hello-world.png)

Other [Glimmer](https://github.com/AndyObtiva/glimmer) DSL gems:
- [glimmer-dsl-swt](https://github.com/AndyObtiva/glimmer-dsl-swt): Glimmer DSL for SWT (JRuby Desktop GUI)
- [glimmer-dsl-opal](https://github.com/AndyObtiva/glimmer-dsl-opal): Glimmer DSL for Opal (Web GUI Adapter for Desktop Apps)
- [glimmer-dsl-xml](https://github.com/AndyObtiva/glimmer-dsl-xml): Glimmer DSL for XML (& HTML)
- [glimmer-dsl-css](https://github.com/AndyObtiva/glimmer-dsl-css): Glimmer DSL for CSS (Cascading Style Sheets)

## Pre-requisites

- [Tcl/Tk](https://www.tcl.tk/): Follow the [install instructions](https://tkdocs.com/tutorial/install.html)
- [Ruby](https://www.ruby-lang.org/en/): On Windows, obtain from the Ruby [download page](https://www.ruby-lang.org/en/downloads/). On the Mac and Linux, it is more convenient to just use [RVM](http://rvm.io) and follow the [RVM Tk instructions](https://rvm.io/integration/tk).

For example, on the Mac, you can: 
- Install the ActiveTcl Mac package from [ActiveState.com](ActiveState.com)
- Install [RVM](https://rvm.io/) by running `\curl -sSL https://get.rvm.io | bash -s stable` (and run `curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -` if needed for mentioned security reasons)
- Run: `rvm install 2.7.1 --enable-shared --enable-pthread --with-tk --with-tcl`

Afterwards, if you open `irb`, you should be able to run `require 'tk'` successfully.

## Setup

### Option 1: Install

Run this command to install directly:
```
gem install glimmer-dsl-tk
```

### Option 2: Bundler 

Add the following to `Gemfile`:
```
gem 'glimmer-dsl-tk', '~> 0.0.3'
```

And, then run:
```
bundle
```

## Tk Concepts

Here is a summary taken from the official [Tk Concepts Tutorial](https://tkdocs.com/tutorial/concepts.html)

Tk Concepts consist of:
- [Widgets](https://tkdocs.com/tutorial/concepts.html#widgets): Widgets are all the things that you see onscreen. In our example, we had a button, an entry, a few labels, and a frame. Others are things like checkboxes, tree views, scrollbars, text areas, and so on. Widgets are what are often referred to as "controls"; you'll also often see them referred to as "windows," particularly in Tk's documentation, a holdover from its X11 roots (so under that terminology, both a toplevel window and things like a button would be called windows).
- [Geometry Management](https://tkdocs.com/tutorial/concepts.html#geometry): If you've been playing around creating widgets, you've probably noticed that just by creating them, they didn't end up showing up onscreen. Having things actually put in the onscreen window, and precisely where in the window they show up is a separate step called geometry management.
- [Event Handling](https://tkdocs.com/tutorial/concepts.html#events): In Tk, as in most other user interface toolkits, there is an event loop which receives events from the operating system. These are things like button presses, keystrokes, mouse movement, window resizing, and so on.

Learn more at the official [Tk Concepts Tutorial](https://tkdocs.com/tutorial/concepts.html)

## Glimmer GUI DSL Concepts

The Glimmer GUI DSL provides a declarative syntax for [Tk](https://www.tcl.tk/) that:
- Supports smart defaults (e.g. grid layout on most widgets)
- Automates wiring of widgets (e.g. nesting a label under a toplevel root or adding a frame to a notebook)
- Hides lower-level details (e.g. main loop is started automatically when opening a window)
- Nests widgets according to their visual hierarchy
- Requires the minimum amount of syntax needed to describe an app's GUI

The Glimmer GUI DSL follows these simple concepts in mapping from Tk syntax:
- **Widget Keyword**: Any Tk widget (e.g. `Tk::Tile::Label`) or toplevel window (e.g. `TkRoot`) may be declared by its lower-case underscored name without the namespace (e.g. `label` or `root`). This is called a keyword and is represented in the Glimmer GUI DSL by a Ruby method behind the scenes.
- **Args**: Any keyword method may optionally take arguments surrounded by parentheses (e.g. a `frame` nested under a `notebook` may receive tab options like `frame(text: 'Users')`, which gets used behind the scenes by Tk code such as `notebook.add tab, text: 'Users'`)
- **Content/Options Block**: Any keyword may optionally be followed by a Ruby curly-brace block containing nested widgets (content) and attributes (options). Attributes are simply Tk option keywords followed by arguments and no block (e.g. `title 'Hello, World!'` under a `root`)

Example of an app written in [Tk](https://www.tcl.tk/) imperative syntax:

```ruby
root = TkRoot.new
root.title = 'Hello, Tab!'

notebook = ::Tk::Tile::Notebook.new(root).grid

tab1 = ::Tk::Tile::Frame.new(notebook).grid
notebook.add tab1, text: 'English'
label1 = ::Tk::Tile::Label.new(tab1).grid
label1.text = 'Hello, World!'

tab2 = ::Tk::Tile::Frame.new(notebook).grid
notebook.add tab2, text: 'French'
label2 = ::Tk::Tile::Label.new(tab2).grid
label2.text = 'Bonjour, Univers!'

root.mainloop
```

Example of the same app written in [Glimmer](https://github.com/AndyObtiva/glimmer) declarative syntax:

```ruby
root {      
  title 'Hello, Tab!'
   
  notebook {
    frame(text: 'English') {
      label {
        text 'Hello, World!'
      }
    }
     
    frame(text: 'French') {
      label {
        text 'Bonjour, Univers!'
      }
    }
  }
}.open
```

### Bidirectional Data-Binding

Glimmer supports bidirectional data-binding via the `bind` keyword, which takes a model and an attribute.

Example:

This assumes a `Person` model with a `country` attribute representing their current country and a `country_options` attribute representing available options for the country attribute.

```ruby
  combobox { |proxy|
    state 'readonly'       
    text bind(person, :country)
  }
```

That binds the `text` selection of the `combobox` to the `country` property on the `person` model.

It automatically handles all the Tk plumbing behind the scenes, such as using `TkVariable` and setting `combobox` `values` from `person.country_options` by convention (attribute_name + "_options").

More details can be found in the [Hello, Combo!](#hello-combo) sample below.

### Command

Buttons can set a `command` option to trigger when the user clicks the button. This may be done with the `command` keyword, passing in a block directly (no need for `proc` as per Tk)

Example:

```ruby
  button { |proxy|
    text "Reset Selection"
    command {
      person.reset_country
    }
  }
```

This resets the person country.

More details can be found in the [Hello, Combo!](#hello-combo) sample below.

## Samples

### Hello, World!

Glimmer code (from [samples/hello/hello_world.rb](samples/hello/hello_world.rb)):

```ruby
include Glimmer

root {
  label {
    text 'Hello, World!'
  }
}.open
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_world.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello world](images/glimmer-dsl-tk-screenshot-sample-hello-world.png)

### Hello, Tab!

Glimmer code (from [samples/hello/hello_tab.rb](samples/hello/hello_tab.rb)):

```ruby
include Glimmer

root {      
  title 'Hello, Tab!'
   
  notebook {
    frame(text: 'English') {
      label {
        text 'Hello, World!'
      }
    }
     
    frame(text: 'French') {
      label {
        text 'Bonjour, Univers!'
      }
    }
  }
}.open
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_tab.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello tab English](images/glimmer-dsl-tk-screenshot-sample-hello-tab-english.png)
![glimmer dsl tk screenshot sample hello tab French](images/glimmer-dsl-tk-screenshot-sample-hello-tab-french.png)

### Hello, Combo!

Glimmer code (from [samples/hello/hello_combo.rb](samples/hello/hello_combo.rb)):

```ruby
# ... more code precedes
root {
  title 'Hello, Combo!'
  
  combobox { |proxy|
    state 'readonly'       
    text bind(person, :country)
  }
  
  button { |proxy|
    text "Reset Selection"
    command {
      person.reset_country
    }
  }
}.open
# ... more code follows
```

Run (with the [glimmer-dsl-tk](https://rubygems.org/gems/glimmer-dsl-tk) gem installed):

```
ruby -r glimmer-dsl-tk -e "require '../samples/hello/hello_combo.rb'"
```

Glimmer app:

![glimmer dsl tk screenshot sample hello combo](images/glimmer-dsl-tk-screenshot-sample-hello-combo.png)
![glimmer dsl tk screenshot sample hello combo dropdown](images/glimmer-dsl-tk-screenshot-sample-hello-combo-dropdown.png)

## Help

### Issues

You may submit [issues](https://github.com/AndyObtiva/glimmer/issues) on [GitHub](https://github.com/AndyObtiva/glimmer/issues).

[Click here to submit an issue.](https://github.com/AndyObtiva/glimmer/issues)

### Chat

If you need live help, try to [![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Process

[Glimmer Process](https://github.com/AndyObtiva/glimmer/blob/master/PROCESS.md)

## Feature Suggestions

These features have been suggested. You might see them in a future version of Glimmer DSL for Tk. You are welcome to contribute more feature suggestions.

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## Contributing

[CONTRIBUTING.md](CONTRIBUTING.md)

## Contributors

* [Andy Maleh](https://github.com/AndyObtiva) (Founder)

[Click here to view contributor commits.](https://github.com/AndyObtiva/glimmer-dsl-tk/graphs/contributors)

## License

[MIT](LICENSE.txt)

Copyright (c) 2020 - Andy Maleh. 

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built for [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library).
