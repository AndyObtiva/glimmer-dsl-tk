# TODO

## Next

- Update Hello, Text! screenshot
- Document entry changed alias for change event, and text insertmarkchange/insertmarkchanged
- Autodiscover format options when moving cursor in `text` widget (auto-derive from applied tags and widget font) and show in top Hello, Text! toolbar comboboxes and buttons
- When setting a `text` format without a selection in Hello, Text!, have it apply when typing
- Hello, Toplevel! (Custom Window and Custom Dialog)
- `icon_photo` as alias for `iconphoto` attribute
- Add defensive programming for preventing spinbox from allowing value to go over `to` (max) when typing by keyboard

## Soon

- Enhance `text` undo/redo to include format/font-format changes
- `text` widget cut/copy with style (perhaps track all applied formatting tags and reapply them to new indexes)
- `text` widget paste with cut/copied style (perhaps track all applied formatting tags and reapply them to new indexes)
- `text` widget paste matching insert mark style (track all applied tags to that location and reapply)
- Fix issue with Hello, Text! whereby after applying background, and foreground to a selection, you cannot apply bold, italic, or underscore for the same selection (or font-size or font-family)
- Make sure to only allow undo/redo when there are changes to be undoed/redoed

- Allow setting root x/y without affecting its default width/height
- Look into updating block_attribute expression to not require defining blocks that simply forward to tk on the widget
- Document Glimmer debug logging

## General

- Implement `code_text` custom widget using `text` and `rouge` gem
- Implement `code_text` line numbers feature, relying on yscrollcommand and yview scroll number
- Update Meta-Sample to use `code_text` custom widget

- Auto-Default to `validate 'key'` when defining `validatecommand {}` or `on('validate') {}` on an `entry`
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
- Hello, Labelframe!
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

- Look into weird crashing issue that occurred after running the first 8 samples in Meta-Sample (Button, Checkbutton, Combobox, Computed, Drag and Drop, Entry, Frame, Label):
```
 % ruby -r puts_debuggerer -r ./lib/glimmer-dsl-tk.rb samples/elaborate/meta_sample.rb
2021-10-21 21:52:30.599 ruby[79034:463168] CoreText note: Client requested name ".SFNSMono-Regular", it will get Times-Roman rather than the intended font. All system UI font access should be through proper APIs such as CTFontCreateUIFontForLanguage() or +[NSFont systemFontOfSize:].
2021-10-21 21:52:30.599 ruby[79034:463168] CoreText note: Set a breakpoint on CTFontLogSystemFontNameRequest to debug.
2021-10-21 21:52:30.701 ruby[79034:463168] CoreText note: Client requested name ".SF NS Mono", it will get Times-Roman rather than the intended font. All system UI font access should be through proper APIs such as CTFontCreateUIFontForLanguage() or +[NSFont systemFontOfSize:].
2021-10-21 21:53:36.022 ruby[79055:464012] CoreText note: Client requested name ".SFNSMono-Regular", it will get Times-Roman rather than the intended font. All system UI font access should be through proper APIs such as CTFontCreateUIFontForLanguage() or +[NSFont systemFontOfSize:].
2021-10-21 21:53:36.022 ruby[79055:464012] CoreText note: Set a breakpoint on CTFontLogSystemFontNameRequest to debug.
2021-10-21 21:53:36.099 ruby[79055:464012] CoreText note: Client requested name ".SF NS Mono", it will get Times-Roman rather than the intended font. All system UI font access should be through proper APIs such as CTFontCreateUIFontForLanguage() or +[NSFont systemFontOfSize:].
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk.rb:1798: [BUG] Illegal instruction at 0x00007fff3057ebc3
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-darwin19]

-- Crash Report log information --------------------------------------------
   See Crash Report log file under the one of following:
     * ~/Library/Logs/DiagnosticReports
     * /Library/Logs/DiagnosticReports
   for more details.
Don't forget to include the above Crash Report log file in bug reports.

-- Control frame information -----------------------------------------------
c:0007 p:---- s:0029 e:000028 CFUNC  :mainloop
c:0006 p:0105 s:0024 e:000023 METHOD /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk.rb:1798
c:0005 p:0042 s:0018 e:000017 METHOD /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/root_proxy.rb:129
c:0004 p:0003 s:0014 e:000013 METHOD /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/root_proxy.rb:46
c:0003 p:0013 s:0010 E:0012c0 METHOD samples/elaborate/meta_sample.rb:134
c:0002 p:0039 s:0006 e:000005 EVAL   samples/elaborate/meta_sample.rb:138 [FINISH]
c:0001 p:0000 s:0003 E:001cf0 (none) [FINISH]

-- Ruby level backtrace information ----------------------------------------
samples/elaborate/meta_sample.rb:138:in `<main>'
samples/elaborate/meta_sample.rb:134:in `launch'
/Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/root_proxy.rb:46:in `open'
/Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/root_proxy.rb:129:in `start_event_loop'
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk.rb:1798:in `mainloop'
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk.rb:1798:in `mainloop'

-- Machine register context ------------------------------------------------
 rax: 0x00007f935c246200 rbx: 0x00007f936023b600 rcx: 0x6206e17b88220036
 rdx: 0x0000000000000001 rdi: 0x00007ffee30b3f50 rsi: 0x0000000000000e0f
 rbp: 0x00007ffee30b43c0 rsp: 0x00007ffee30b43b0  r8: 0x0000000000000e00
  r9: 0x00007f935c24700f r10: 0x000000000000000f r11: 0x00007ffee30b3a6e
 r12: 0x00007f935c0a54c8 r13: 0x0000000000000002 r14: 0x00007fff6bd6fe40
 r15: 0x00007f936022e310 rip: 0x00007fff3057ebc3 rfl: 0x0000000000010202

-- C level backtrace information -------------------------------------------
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(rb_vm_bugreport+0x6cf) [0x10cdeac2f]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cc01596) [0x10cc01596]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cd3edcb) [0x10cd3edcb]
/usr/lib/system/libsystem_platform.dylib(_sigtramp+0x1d) [0x7fff6d1195fd]
/System/Library/Frameworks/AppKit.framework/Versions/C/AppKit(-[NSApplication _crashOnException:]+0x6a) [0x7fff3057ebc3]
/System/Library/Frameworks/AppKit.framework/Versions/C/AppKit(0x7fff3033d50c) [0x7fff3033d50c]
/System/Library/Frameworks/AppKit.framework/Versions/C/AppKit(0x7fff30a5bc20) [0x7fff30a5bc20]
/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation(__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__+0x17) [0x7fff32f3a6ec]
/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation(0x7fff32f3a61c) [0x7fff32f3a61c]
/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation(0x7fff32f39bb4) [0x7fff32f39bb4]
/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation(0x7fff32f391e3) [0x7fff32f391e3]
/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox(RunCurrentEventLoopInMode+0x124) [0x7fff31b54abd]
/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox(0x7fff31b546f4) [0x7fff31b546f4]
/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox(0x7fff31b54579) [0x7fff31b54579]
/System/Library/Frameworks/AppKit.framework/Versions/C/AppKit(0x7fff3019d669) [0x7fff3019d669]
/System/Library/Frameworks/AppKit.framework/Versions/C/AppKit(0x7fff3019beb0) [0x7fff3019beb0]
/Library/Frameworks/Tk.framework/Versions/8.6/Tk(TkMacOSXEventsCheckProc+0x15c) [0x10e65393f]
/Library/Frameworks/Tcl.framework/Versions/8.6/Tcl(Tcl_DoOneEvent+0x12c) [0x10e4ea5c7]
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle(call_DoOneEvent_core+0x10) [0x10e3faa00]
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle(0x10e3fa4c4) [0x10e3fa4c4]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cc0d7c2) [0x10cc0d7c2]
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle(0x10e3f311d) [0x10e3f311d]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cc0d9cb) [0x10cc0d9cb]
/Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle(0x10e3f6527) [0x10e3f6527]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cde065f) [0x10cde065f]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cdd81dc) [0x10cdd81dc]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cdbb6fd) [0x10cdbb6fd]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cdd21e9) [0x10cdd21e9]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cc0c907) [0x10cc0c907]
/Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib(0x10cc0c787) [0x10cc0c787]
/Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby(main+0x5d) [0x10cb4cf0d]

-- Other runtime information -----------------------------------------------

* Loaded script: samples/elaborate/meta_sample.rb

* Loaded features:

    0 enumerator.so
    1 thread.rb
    2 rational.so
    3 complex.so
    4 ruby2_keywords.rb
    5 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
    6 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/trans/transdb.bundle
    7 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/rbconfig.rb
    8 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/compatibility.rb
    9 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/defaults.rb
   10 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/deprecate.rb
   11 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/errors.rb
   12 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/exceptions.rb
   13 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/basic_specification.rb
   14 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/stub_specification.rb
   15 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/text.rb
   16 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/user_interaction.rb
   17 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/specification_policy.rb
   18 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/util/list.rb
   19 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/platform.rb
   20 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/version.rb
   21 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/requirement.rb
   22 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/specification.rb
   23 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/util.rb
   24 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/dependency.rb
   25 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/core_ext/kernel_gem.rb
   26 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/monitor.bundle
   27 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/monitor.rb
   28 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/core_ext/kernel_require.rb
   29 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/core_ext/kernel_warn.rb
   30 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems.rb
   31 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/path_support.rb
   32 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/version.rb
   33 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/core_ext/name_error.rb
   34 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/levenshtein.rb
   35 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/jaro_winkler.rb
   36 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checker.rb
   37 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/name_error_checkers/class_name_checker.rb
   38 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/name_error_checkers/variable_name_checker.rb
   39 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/name_error_checkers.rb
   40 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/method_name_checker.rb
   41 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/key_error_checker.rb
   42 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/null_checker.rb
   43 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/tree_spell_checker.rb
   44 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/spell_checkers/require_path_checker.rb
   45 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean/formatters/plain_formatter.rb
   46 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/did_you_mean.rb
   47 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/site_ruby/3.0.0/rubygems/bundler_version_finder.rb
   48 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/stringio.bundle
   49 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/puts_debuggerer-0.13.1/lib/puts_debuggerer/core_ext/kernel.rb
   50 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/puts_debuggerer-0.13.1/lib/puts_debuggerer/core_ext/logger.rb
   51 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/puts_debuggerer-0.13.1/lib/puts_debuggerer/core_ext/logging/logger.rb
   52 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/puts_debuggerer-0.13.1/lib/puts_debuggerer/run_determiner.rb
   53 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/puts_debuggerer-0.13.1/lib/puts_debuggerer/source_file.rb
   54 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/puts_debuggerer-0.13.1/lib/puts_debuggerer.rb
   55 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger/version.rb
   56 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger/formatter.rb
   57 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger/period.rb
   58 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger/log_device.rb
   59 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger/severity.rb
   60 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger/errors.rb
   61 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/logger.rb
   62 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/set.rb
   63 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/array_include_methods-1.4.0/lib/array_include_methods.rb
   64 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/shim/concurrent.rb
   65 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/config.rb
   66 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/ext/module.rb
   67 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/error.rb
   68 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/invalid_keyword_error.rb
   69 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/forwardable/impl.rb
   70 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/forwardable.rb
   71 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/camelcase.rb
   72 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/dsl/expression_handler.rb
   73 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/dsl/engine.rb
   74 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer.rb
   75 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
   76 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkutil.bundle
   77 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/ttk_selector.rb
   78 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/autoload.rb
   79 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/event.rb
   80 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
   81 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_kr.bundle
   82 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/big5.bundle
   83 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/cp949.bundle
   84 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_jp.bundle
   85 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_10.bundle
   86 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_13.bundle
   87 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_14.bundle
   88 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_15.bundle
   89 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_16.bundle
   90 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_1.bundle
   91 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_2.bundle
   92 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_3.bundle
   93 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_r.bundle
   94 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_4.bundle
   95 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1250.bundle
   96 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_5.bundle
   97 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1251.bundle
   98 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_6.bundle
   99 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_u.bundle
  100 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1252.bundle
  101 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_7.bundle
  102 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1253.bundle
  103 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_8.bundle
  104 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_9.bundle
  105 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1254.bundle
  106 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_31j.bundle
  107 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1257.bundle
  108 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/shift_jis.bundle
  109 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/gbk.bundle
  110 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/winfo.rb
  111 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/wm.rb
  112 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/itemfont.rb
  113 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/itemconfig.rb
  114 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/busy.rb
  115 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/version.rb
  116 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/setup.rb
  117 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk.rb
  118 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/versions.rb
  119 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/exception.rb
  120 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/syntax_error.rb
  121 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.bundle
  122 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/omap.rb
  123 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/set.rb
  124 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/class_loader.rb
  125 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/strscan.bundle
  126 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/scalar_scanner.rb
  127 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/node.rb
  128 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/stream.rb
  129 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/document.rb
  130 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/sequence.rb
  131 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/scalar.rb
  132 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/mapping.rb
  133 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes/alias.rb
  134 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/nodes.rb
  135 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/streaming.rb
  136 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors/visitor.rb
  137 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors/to_ruby.rb
  138 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors/emitter.rb
  139 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/handler.rb
  140 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/tree_builder.rb
  141 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors/yaml_tree.rb
  142 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/json/ruby_events.rb
  143 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors/json_tree.rb
  144 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors/depth_first.rb
  145 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/visitors.rb
  146 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/parser.rb
  147 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/coder.rb
  148 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/core_ext.rb
  149 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/stream.rb
  150 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/json/yaml_events.rb
  151 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/json/tree_builder.rb
  152 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/json/stream.rb
  153 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych/handlers/document_stream.rb
  154 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.rb
  155 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/yaml.rb
  156 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/os-1.1.1/lib/os.rb
  157 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/symbolize_keys.rb
  158 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/dsl/expression.rb
  159 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/attribute_expression.rb
  160 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/snakecase.rb
  161 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/underscore.rb
  162 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/dsl/static_expression.rb
  163 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/observable.rb
  164 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/observable_model.rb
  165 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/observable_array.rb
  166 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/observable_hash.rb
  167 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/observer.rb
  168 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/model_binding.rb
  169 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/bind_expression.rb
  170 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/block_attribute_expression.rb
  171 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/data_binding/tk/widget_binding.rb
  172 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/data_binding_expression.rb
  173 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/commandable.rb
  174 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/button_proxy.rb
  175 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/variable_owner.rb
  176 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/checkbutton_proxy.rb
  177 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/text_variable_owner.rb
  178 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/combobox_proxy.rb
  179 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/entry_proxy.rb
  180 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/notebook_proxy.rb
  181 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/frame_proxy.rb
  182 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/label_proxy.rb
  183 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/list_proxy.rb
  184 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/radiobutton_proxy.rb
  185 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/root_proxy.rb
  186 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/text_proxy.rb
  187 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/treeview_proxy.rb
  188 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/widget_proxy.rb
  189 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/tk/spinbox_proxy.rb
  190 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/format_expression.rb
  191 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/data_binding/tk/list_selection_binding.rb
  192 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/list_selection_data_binding_expression.rb
  193 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/message_box_expression.rb
  194 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/on_expression.rb
  195 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/dsl/parent_expression.rb
  196 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/dsl/top_level_expression.rb
  197 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/root_expression.rb
  198 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/glimmer-2.4.0/lib/glimmer/data_binding/shine.rb
  199 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/shine_data_binding_expression.rb
  200 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/widget_expression.rb
  201 /Users/andy/code/glimmer-dsl-tk/lib/glimmer/dsl/tk/dsl.rb
  202 /Users/andy/code/glimmer-dsl-tk/lib/glimmer-dsl-tk.rb
  203 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/version.rb
  204 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/before.rb
  205 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/after.rb
  206 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/average.rb
  207 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/collapse.rb
  208 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/commonality.rb
  209 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/collisions.rb
  210 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/conjoin.rb
  211 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/contains.rb
  212 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/delete_unless.rb
  213 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/delete_values.rb
  214 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/delete.rb
  215 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/divide.rb
  216 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/duplicates.rb
  217 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/each_pair.rb
  218 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/each_value.rb
  219 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/probability.rb
  220 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/entropy.rb
  221 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/extract_options.rb
  222 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/from.rb
  223 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/indexable.rb
  224 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/store.rb
  225 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/splice.rb
  226 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/indexable.rb
  227 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/merge.rb
  228 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/mode.rb
  229 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/nonuniq.rb
  230 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/not_empty.rb
  231 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/only.rb
  232 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/pad.rb
  233 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/pull.rb
  234 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/peek.rb
  235 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/unique_permutation.rb
  236 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/poke.rb
  237 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/occurrence.rb
  238 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/recurse.rb
  239 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/functor.rb
  240 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/recursively.rb
  241 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/recursively.rb
  242 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/reject_values.rb
  243 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/split.rb
  244 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/squeeze.rb
  245 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/squeeze.rb
  246 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/thru.rb
  247 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/to_h.rb
  248 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/traverse.rb
  249 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array/uniq_by.rb
  250 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/array.rb
  251 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/callstack.rb
  252 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/callstack.rb
  253 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/caller.rb
  254 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/call_stack.rb
  255 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/defined.rb
  256 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/op_get.rb
  257 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/op.rb
  258 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/op_set.rb
  259 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/self.rb
  260 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/with.rb
  261 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/__callee__.rb
  262 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding/__method__.rb
  263 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/binding.rb
  264 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/true.rb
  265 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/false.rb
  266 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/boolean.rb
  267 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/class/subclasses.rb
  268 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/class/descendants.rb
  269 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/methodize.rb
  270 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/class/methodize.rb
  271 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/pathize.rb
  272 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/class/pathize.rb
  273 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/class/to_proc.rb
  274 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/class.rb
  275 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/cap.rb
  276 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/at_least.rb
  277 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/at_most.rb
  278 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/clip.rb
  279 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/bound.rb
  280 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/cmp.rb
  281 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable/op_get.rb
  282 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/comparable.rb
  283 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerator/fx.rb
  284 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerator.rb
  285 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/denumerable.rb
  286 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir/ascend.rb
  287 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir/descend.rb
  288 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir/each_child.rb
  289 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir/multiglob.rb
  290 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir/parent.rb
  291 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir/recurse.rb
  292 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/dir.rb
  293 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/accumulate.rb
  294 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/cluster.rb
  295 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/map_with_index.rb
  296 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/collect_with_index.rb
  297 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/compact_map.rb
  298 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/defer.rb
  299 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/each_by.rb
  300 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/per.rb
  301 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/every.rb
  302 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/ewise.rb
  303 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/exclude.rb
  304 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/expand.rb
  305 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/filter.rb
  306 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/find_yield.rb
  307 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/frequency.rb
  308 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/graph.rb
  309 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/incase.rb
  310 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/key_by.rb
  311 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/map_by.rb
  312 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/map_detect.rb
  313 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/map_send.rb
  314 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/map_with.rb
  315 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/mash.rb
  316 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/modulate.rb
  317 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/occur.rb
  318 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/organize_by.rb
  319 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/only.rb
  320 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/pair.rb
  321 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/purge.rb
  322 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/sum.rb
  323 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/value_by.rb
  324 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/uniq_by.rb
  325 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/visit.rb
  326 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable/zip_map.rb
  327 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/enumerable.rb
  328 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/exception/detail.rb
  329 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/exception/raised.rb
  330 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/exception/suppress.rb
  331 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/exception.rb
  332 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/append.rb
  333 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/common_path.rb
  334 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/create.rb
  335 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/ext.rb
  336 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/null.rb
  337 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/read_binary.rb
  338 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/read_list.rb
  339 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/rewrite.rb
  340 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/rootname.rb
  341 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/sanitize.rb
  342 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/split_all.rb
  343 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/split_root.rb
  344 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/write.rb
  345 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file/writelines.rb
  346 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/file.rb
  347 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest/separator_pattern.rb
  348 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest/relative.rb
  349 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest/absolute.rb
  350 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest/contains.rb
  351 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest/root.rb
  352 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest/safe.rb
  353 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/filetest.rb
  354 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/round_to.rb
  355 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/float/round_to.rb
  356 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/float.rb
  357 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/alias.rb
  358 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/argumentize.rb
  359 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/at.rb
  360 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/autonew.rb
  361 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/collate.rb
  362 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/count.rb
  363 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/dearray_values.rb
  364 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/deep_merge.rb
  365 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/delete_at.rb
  366 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/delete_values.rb
  367 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/delete_unless.rb
  368 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/delete.rb
  369 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/diff.rb
  370 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/each_with_key.rb
  371 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/except.rb
  372 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/fetch_nested.rb
  373 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/graph.rb
  374 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/insert.rb
  375 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/inverse.rb
  376 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/join.rb
  377 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/keys.rb
  378 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/mash.rb
  379 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/new_with.rb
  380 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op_and.rb
  381 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op_or.rb
  382 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op_add.rb
  383 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op_sub.rb
  384 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op_mul.rb
  385 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op_push.rb
  386 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/op.rb
  387 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/recurse.rb
  388 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/recursively.rb
  389 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/rekey.rb
  390 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/replace_each.rb
  391 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/reverse_merge.rb
  392 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/slice.rb
  393 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/stringify_keys.rb
  394 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/subset.rb
  395 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/swap.rb
  396 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/to_mod.rb
  397 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/to_options.rb
  398 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/to_proc.rb
  399 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/to_struct.rb
  400 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/traverse.rb
  401 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/update_each.rb
  402 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/update_keys.rb
  403 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/update_values.rb
  404 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/update.rb
  405 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/weave.rb
  406 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash/zip.rb
  407 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/hash.rb
  408 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer/bitmask.rb
  409 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer/bit.rb
  410 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer/factorial.rb
  411 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer/multiple.rb
  412 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer/of.rb
  413 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer/ordinal.rb
  414 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/integer.rb
  415 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/as.rb
  416 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/ask.rb
  417 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/na.rb
  418 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/assign.rb
  419 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/assign_from.rb
  420 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/attr_singleton.rb
  421 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/blank.rb
  422 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/call_stack.rb
  423 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/case.rb
  424 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/complete.rb
  425 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/constant.rb
  426 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/d.rb
  427 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/deep_clone.rb
  428 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/deep_copy.rb
  429 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/disable_warnings.rb
  430 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/meta.rb
  431 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/eigen.rb
  432 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/enable_warnings.rb
  433 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/ergo.rb
  434 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/extend.rb
  435 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/extension.rb
  436 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/here.rb
  437 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/identical.rb
  438 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/in.rb
  439 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/instance_assign.rb
  440 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/instance_class.rb
  441 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/instance_extract.rb
  442 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/instance_replace.rb
  443 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/instance_send.rb
  444 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/like.rb
  445 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/require_all.rb
  446 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/load_all.rb
  447 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/load_relative.rb
  448 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/maybe.rb
  449 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/meta_class.rb
  450 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/meta_alias.rb
  451 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/meta_def.rb
  452 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/meta_eval.rb
  453 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/method.rb
  454 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/yes.rb
  455 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/no.rb
  456 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/not.rb
  457 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/not_nil.rb
  458 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/object_class.rb
  459 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/object_hexid.rb
  460 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/object_send.rb
  461 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/p.rb
  462 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/presence.rb
  463 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/present.rb
  464 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/qua_class.rb
  465 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/respond.rb
  466 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/returning.rb
  467 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/silence.rb
  468 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/silence_warnings.rb
  469 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/singleton_class.rb
  470 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/super_method.rb
  471 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/tap.rb
  472 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/temporarily.rb
  473 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/try.rb
  474 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/val.rb
  475 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/with.rb
  476 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/writers.rb
  477 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/__class__.rb
  478 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/__dir__.rb
  479 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/__get__.rb
  480 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel/__set__.rb
  481 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/kernel.rb
  482 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/lazy.rb
  483 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/matchdata/match.rb
  484 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/matchdata/matchset.rb
  485 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/matchdata.rb
  486 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/method/composition.rb
  487 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/method/op_mul.rb
  488 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/method/op_pow.rb
  489 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/method.rb
  490 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/abstract.rb
  491 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/alias_accessor.rb
  492 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/alias_method_chain.rb
  493 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/alias_module_function.rb
  494 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/all_instance_methods.rb
  495 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/ancestor.rb
  496 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/anonymous.rb
  497 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/attr_setter.rb
  498 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/lastname.rb
  499 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/basename.rb
  500 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/can.rb
  501 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/class.rb
  502 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/module_def.rb
  503 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/class_def.rb
  504 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/instance_method_defined.rb
  505 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/class_method_defined.rb
  506 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/extend.rb
  507 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/home.rb
  508 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/homename.rb
  509 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/housing.rb
  510 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/include_function_module.rb
  511 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/instance_method.rb
  512 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/redirect_method.rb
  513 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/redefine_method.rb
  514 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/rename_method.rb
  515 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/wrap_method.rb
  516 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/nodef.rb
  517 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/integrate.rb
  518 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/is.rb
  519 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/methodize.rb
  520 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/modname.rb
  521 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/op.rb
  522 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/op_add.rb
  523 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/op_mul.rb
  524 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/op_sub.rb
  525 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/pathize.rb
  526 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/remove.rb
  527 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/revise.rb
  528 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/set.rb
  529 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/singleton_method_defined.rb
  530 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/spacename.rb
  531 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module/to_obj.rb
  532 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/module.rb
  533 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/nilclass/ergo.rb
  534 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/nilclass.rb
  535 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/approx.rb
  536 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/distance.rb
  537 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/length.rb
  538 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/positive.rb
  539 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/negative.rb
  540 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric/spacing.rb
  541 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/numeric.rb
  542 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/object/dup.rb
  543 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/object/clone.rb
  544 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/object/itself.rb
  545 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/object/object_state.rb
  546 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/object/try_dup.rb
  547 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/object.rb
  548 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/objectspace/classes.rb
  549 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/objectspace/op_fetch.rb
  550 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/objectspace.rb
  551 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc/bind.rb
  552 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc/bind_to.rb
  553 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc/compose.rb
  554 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc/partial.rb
  555 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc/to_method.rb
  556 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc/update.rb
  557 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/proc.rb
  558 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/process/daemon.rb
  559 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/process.rb
  560 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/range/combine.rb
  561 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/range/overlap.rb
  562 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/range/to_rng.rb
  563 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/range/within.rb
  564 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/range/umbrella.rb
  565 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/range.rb
  566 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/regexp/arity.rb
  567 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/regexp/multiline.rb
  568 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/regexp/op_add.rb
  569 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/regexp/op_or.rb
  570 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/regexp/to_re.rb
  571 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/regexp.rb
  572 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/acronym.rb
  573 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/align.rb
  574 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/bracket.rb
  575 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/capitalized.rb
  576 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/characters.rb
  577 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/cleanlines.rb
  578 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/cleave.rb
  579 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/cmp.rb
  580 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/compress_lines.rb
  581 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/divide.rb
  582 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/words.rb
  583 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/each_word.rb
  584 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/edit_distance.rb
  585 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/starts_with.rb
  586 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/ends_with.rb
  587 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/exclude.rb
  588 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/expand_tab.rb
  589 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/file.rb
  590 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/fold.rb
  591 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/indent.rb
  592 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/index_all.rb
  593 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/interpolate.rb
  594 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/lchomp.rb
  595 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/line_wrap.rb
  596 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/linear.rb
  597 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/uppercase.rb
  598 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/lowercase.rb
  599 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/margin.rb
  600 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/modulize.rb
  601 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/mscan.rb
  602 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/natcmp.rb
  603 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/nchar.rb
  604 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/newlines.rb
  605 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/number.rb
  606 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/op_div.rb
  607 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/remove.rb
  608 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/op_sub.rb
  609 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/outdent.rb
  610 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/quote.rb
  611 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/random.rb
  612 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/range.rb
  613 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/range_all.rb
  614 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/range_of_line.rb
  615 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/rewrite.rb
  616 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/rotate.rb
  617 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/shatter.rb
  618 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/similarity.rb
  619 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/store.rb
  620 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/splice.rb
  621 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/squish.rb
  622 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/subtract.rb
  623 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/titlecase.rb
  624 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/to_re.rb
  625 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/unbracket.rb
  626 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/unfold.rb
  627 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/unindent.rb
  628 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/unquote.rb
  629 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/variablize.rb
  630 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/word_wrap.rb
  631 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string/xor.rb
  632 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/string.rb
  633 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/struct/attributes.rb
  634 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/struct/replace.rb
  635 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/struct.rb
  636 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/as_s.rb
  637 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/plain.rb
  638 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/bang.rb
  639 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/call.rb
  640 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/chomp.rb
  641 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/generate.rb
  642 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/not.rb
  643 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/op_div.rb
  644 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/query.rb
  645 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/setter.rb
  646 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/succ.rb
  647 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/thrown.rb
  648 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol/variablize.rb
  649 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/symbol.rb
  650 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/set.rb
  651 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/dst_adjustment.rb
  652 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/shift.rb
  653 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/ago.rb
  654 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/change.rb
  655 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/elapse.rb
  656 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/future.rb
  657 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/in.rb
  658 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/hence.rb
  659 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/less.rb
  660 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/past.rb
  661 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/trunc.rb
  662 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/round_to.rb
  663 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/stamp.rb
  664 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time/to_time.rb
  665 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/time.rb
  666 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/unboundmethod/arguments.rb
  667 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets/unboundmethod.rb
  668 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/facets-3.1.0/lib/core/facets.rb
  669 /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/fileutils.rb
  670 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/menuspec.rb
  671 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/root.rb
  672 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/setup.rb
  673 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/package.rb
  674 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/font.rb
  675 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile.rb
  676 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/label.rb
  677 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/button.rb
  678 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tbutton.rb
  679 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/radiobutton.rb
  680 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/checkbutton.rb
  681 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tcheckbutton.rb
  682 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tradiobutton.rb
  683 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/scrollable.rb
  684 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/validation.rb
  685 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/entry.rb
  686 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tentry.rb
  687 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tcombobox.rb
  688 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tlabel.rb
  689 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tspinbox.rb
  690 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/frame.rb
  691 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkextlib/tile/tframe.rb
  692 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/bindtag.rb
  693 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/toplevel.rb
  694 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/grid.rb
  695 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/variable.rb
  696 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/txtwin_abst.rb
  697 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/text.rb
  698 /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tk/image.rb

* Process memory map:

10cb49000-10cb4d000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
10cb4d000-10cb51000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
10cb51000-10cb55000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
10cb55000-10cb56000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
10cb56000-10cb59000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10cb59000-10cb5a000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10cb5a000-10cea2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10cea2000-10ceaa000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10ceaa000-10ceae000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10ceae000-10cebe000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10cebe000-10cf17000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
10cf17000-10cf1a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf1a000-10cf1c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf1c000-10cf1d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf1d000-10cf1e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf1e000-10cf1f000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf1f000-10cf23000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf23000-10cf24000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf24000-10cf25000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf25000-10cf29000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf29000-10cf2a000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf2a000-10cf2b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf2b000-10cf6b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf6b000-10cf6c000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10cf6c000-10d00d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d00d000-10d00e000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d00e000-10d0af000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d0af000-10d0b0000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d0b0000-10d151000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d151000-10d152000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d152000-10d1f3000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d1f3000-10d1f4000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d1f4000-10d295000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d295000-10d296000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d296000-10d337000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d337000-10d338000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d338000-10d3d9000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d3d9000-10d3da000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d3da000-10d47b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d47b000-10d47c000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d47c000-10d51d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d51d000-10d51e000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d51e000-10d5bf000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d5bf000-10d5c0000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d5c0000-10d661000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d661000-10d662000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d662000-10d703000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d703000-10d704000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d704000-10d7a5000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d7a5000-10d7a6000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d7a6000-10d847000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d847000-10d848000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d848000-10d8e9000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d8e9000-10d8ea000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d8ea000-10d98b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d98b000-10d98c000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10d98c000-10da2d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10da2d000-10da2e000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10da2e000-10dacf000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dacf000-10dad0000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dad0000-10db71000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10db71000-10db72000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10db72000-10dc13000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dc13000-10dc14000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dc14000-10dcb5000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dcb5000-10dcb6000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dcb6000-10dd57000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dd57000-10dd58000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dd58000-10ddf9000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10ddf9000-10ddfa000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10ddfa000-10de9b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10de9b000-10de9c000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10de9c000-10df3d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10df3d000-10df3e000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10df3e000-10dfdf000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dfdf000-10dfe0000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10dfe0000-10e081000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e081000-10e082000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e082000-10e123000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e123000-10e124000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e124000-10e1c5000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e1c5000-10e1c6000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e1c6000-10e267000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e267000-10e268000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e268000-10e309000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e309000-10e30a000 --- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e30a000-10e3ab000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e3ab000-10e3af000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e3af000-10e3b3000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e3b3000-10e3b7000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e3b7000-10e3b8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/encdb.bundle
10e3b8000-10e3bb000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/trans/transdb.bundle
10e3bb000-10e3bf000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/trans/transdb.bundle
10e3bf000-10e3c3000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/trans/transdb.bundle
10e3c3000-10e3c7000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/trans/transdb.bundle
10e3c7000-10e3c8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/trans/transdb.bundle
10e3c8000-10e3cb000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/monitor.bundle
10e3cb000-10e3cf000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/monitor.bundle
10e3cf000-10e3d3000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/monitor.bundle
10e3d3000-10e3d7000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/monitor.bundle
10e3d7000-10e3d8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/monitor.bundle
10e3d8000-10e3db000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/stringio.bundle
10e3db000-10e3e3000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/stringio.bundle
10e3e3000-10e3e7000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/stringio.bundle
10e3e7000-10e3eb000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/stringio.bundle
10e3eb000-10e3ee000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/stringio.bundle
10e3ee000-10e3ef000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
10e3ef000-10e407000 r-x /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
10e407000-10e40b000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
10e40b000-10e40f000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
10e40f000-10e416000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
10e416000-10e417000 rw- /usr/local/Cellar/zlib/1.2.11/lib/libz.1.2.11.dylib
10e417000-10e428000 r-x /usr/local/Cellar/zlib/1.2.11/lib/libz.1.2.11.dylib
10e428000-10e429000 r-- /usr/local/Cellar/zlib/1.2.11/lib/libz.1.2.11.dylib
10e429000-10e42a000 rw- /usr/local/Cellar/zlib/1.2.11/lib/libz.1.2.11.dylib
10e42a000-10e42c000 r-- /usr/local/Cellar/zlib/1.2.11/lib/libz.1.2.11.dylib
10e42c000-10e55b000 r-x /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
10e55b000-10e56a000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
10e56a000-10e56b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
10e56b000-10e58e000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
10e58e000-10e682000 r-x /Library/Frameworks/Tk.framework/Versions/8.6/Tk
10e682000-10e6aa000 rw- /Library/Frameworks/Tk.framework/Versions/8.6/Tk
10e6aa000-10e6ab000 rw- /Library/Frameworks/Tk.framework/Versions/8.6/Tk
10e6ab000-10e6d4000 r-- /Library/Frameworks/Tk.framework/Versions/8.6/Tk
10e6d4000-10e6dc000 r-x /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkutil.bundle
10e6dc000-10e6e0000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkutil.bundle
10e6e0000-10e6e4000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkutil.bundle
10e6e4000-10e6e7000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tkutil.bundle
10e6e7000-10e6e8000 rw- /Library/Preferences/Logging/.plist-cache.hvQyVUOg
10e6e8000-10e6ec000 r-- /Library/Preferences/Logging/.plist-cache.hvQyVUOg
10e6ec000-10e6f3000 r-- /Library/Preferences/Logging/.plist-cache.hvQyVUOg
10e6f3000-10e6f7000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e6f7000-10e6f8000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e6f8000-10e6f9000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e6f9000-10e6fa000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e6fa000-10e6fb000 rw- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e6fb000-10e6fe000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e6fe000-10e701000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e701000-10e702000 rw- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e702000-10e782000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e782000-10e783000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e783000-10e78b000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e78b000-10e790000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e790000-10e795000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e795000-10e797000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e797000-10e7d3000 r-- /private/var/db/timezone/tz/2021a.2.0/icutz/icutz44l.dat
10e7d3000-10e7e2000 r-- /System/Library/Fonts/Keyboard.ttf
10e7e2000-10e7e3000 r-- /usr/lib/libobjc-trampolines.dylib
10e7e3000-10e7e4000 rw- /usr/lib/libobjc-trampolines.dylib
10e7e4000-10e7f4000 rw- /usr/lib/libobjc-trampolines.dylib
10e7f4000-10e7f8000 r-x /usr/lib/libobjc-trampolines.dylib
10e7f8000-10e7fd000 r-- /usr/lib/libobjc-trampolines.dylib
10e7fd000-10e800000 rw- /usr/share/icu/icudt64l.dat
10e800000-10f000000 rw- /usr/share/icu/icudt64l.dat
10f000000-110b4c000 r-- /usr/share/icu/icudt64l.dat
110b4c000-110d5e000 r-- /System/Library/Fonts/SFNS.ttf
110d5e000-110d95000 r-- /System/Library/Fonts/SFNSMono.ttf
110d95000-1112c2000 rw- /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Resources/Extras2.rsrc
1112c2000-111658000 r-- /System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/SystemAppearance.car
111658000-1116be000 r-- /System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/VibrantLightAppearance.car
1116be000-1116e0000 r-- /System/Library/Caches/com.apple.IntlDataCache.le.kbdx
1116e0000-1116e3000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
1116e3000-1116e4000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
1116e4000-1116e5000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
1116e5000-111701000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111701000-111704000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111706000-111716000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111716000-111717000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111717000-111718000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111718000-11171b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11171b000-11171c000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11171c000-11171f000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11171f000-11172f000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11172f000-11173a000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11173a000-11173b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11173b000-11173d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11173d000-11173e000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11173e000-111749000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111749000-11174b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11174b000-11174c000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11174c000-11176f000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11176f000-111770000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111770000-111771000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111771000-111772000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111772000-111773000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111773000-111774000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111774000-111777000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111777000-11177a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11177a000-11177d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11177d000-11177f000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11177f000-111782000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111782000-111784000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111784000-111790000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111790000-111791000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111791000-111792000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111792000-111793000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111793000-111796000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111796000-111797000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111797000-111798000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
111798000-11179b000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11179b000-11179c000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11179c000-11179d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
11179e000-1117a1000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
1117a1000-1117a4000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
1117a4000-1117b1000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/bin/ruby
1117b1000-1117d7000 r-- /usr/lib/system/libsystem_platform.dylib
1117e5000-111805000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
111805000-111825000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
111825000-11184c000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/tk-0.4.0/lib/tcltklib.bundle
111925000-111926000 rw- /usr/lib/libobjc-trampolines.dylib
111926000-11192a000 r-x /usr/lib/libobjc-trampolines.dylib
11192a000-11192b000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11192b000-11192c000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11192c000-11192d000 --- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11192d000-111931000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111931000-111932000 --- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111932000-111933000 --- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111933000-111937000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111937000-111938000 --- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111938000-11193c000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11193c000-11193d000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11193d000-11193e000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11193e000-11193f000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11193f000-11195e000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11195e000-11195f000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111971000-111972000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111972000-111973000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111973000-111974000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111974000-111975000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111975000-111976000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111976000-111977000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111977000-111978000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111978000-111979000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111979000-11197a000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11197a000-111981000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111981000-111982000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111982000-111984000 r-- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111984000-111985000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111985000-111989000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111989000-11198a000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11198a000-11198b000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
11198b000-1119ab000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
1119ab000-1119cb000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
1119cb000-1119cc000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
1119cc000-111a1c000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/3902/libraries.data
111a1c000-111a3c000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/C/com.apple.metal/Intel HD Graphics 4000/functions.data
111a3c000-111a3d000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111a3d000-111a4f000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111a4f000-111a5f000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111a5f000-111a7f000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111a7f000-111a8f000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111a8f000-111aae000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111aaf000-111ab0000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111ab0000-111ab4000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111ab4000-111ab8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111ab8000-111abc000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111abc000-111abd000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_11.bundle
111abd000-111ac0000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_kr.bundle
111ac0000-111ac4000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_kr.bundle
111ac4000-111ac8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_kr.bundle
111ac8000-111acc000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_kr.bundle
111acc000-111acd000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_kr.bundle
111acd000-111ad0000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/big5.bundle
111ad0000-111ad4000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/big5.bundle
111ad4000-111ad8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/big5.bundle
111ad8000-111adc000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/big5.bundle
111adc000-111add000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/big5.bundle
111add000-111ae0000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/cp949.bundle
111ae0000-111ae4000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/cp949.bundle
111ae4000-111ae8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/cp949.bundle
111ae8000-111aec000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/cp949.bundle
111aec000-111aed000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/cp949.bundle
111aed000-111af0000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_jp.bundle
111af0000-111af4000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_jp.bundle
111af4000-111af8000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_jp.bundle
111af8000-111afc000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_jp.bundle
111afc000-111afd000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/euc_jp.bundle
111afd000-111b00000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_10.bundle
111b00000-111b04000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_10.bundle
111b04000-111b08000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_10.bundle
111b08000-111b0c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_10.bundle
111b0c000-111b0d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_10.bundle
111b0d000-111b10000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_13.bundle
111b10000-111b14000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_13.bundle
111b14000-111b18000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_13.bundle
111b18000-111b1c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_13.bundle
111b1c000-111b1d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_13.bundle
111b1d000-111b20000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_14.bundle
111b20000-111b24000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_14.bundle
111b24000-111b28000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_14.bundle
111b28000-111b2c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_14.bundle
111b2c000-111b2d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_14.bundle
111b2d000-111b30000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_15.bundle
111b30000-111b34000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_15.bundle
111b34000-111b38000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_15.bundle
111b38000-111b3c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_15.bundle
111b3c000-111b3d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_15.bundle
111b3d000-111b40000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_16.bundle
111b40000-111b44000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_16.bundle
111b44000-111b48000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_16.bundle
111b48000-111b4c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_16.bundle
111b4c000-111b4d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_16.bundle
111b4d000-111b50000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_1.bundle
111b50000-111b54000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_1.bundle
111b54000-111b58000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_1.bundle
111b58000-111b5c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_1.bundle
111b5c000-111b5d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_1.bundle
111b5d000-111b60000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_2.bundle
111b60000-111b64000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_2.bundle
111b64000-111b68000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_2.bundle
111b68000-111b6c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_2.bundle
111b6c000-111b6d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_2.bundle
111b6d000-111b70000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_3.bundle
111b70000-111b74000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_3.bundle
111b74000-111b78000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_3.bundle
111b78000-111b7c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_3.bundle
111b7c000-111b7d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_3.bundle
111b7d000-111b80000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_r.bundle
111b80000-111b84000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_r.bundle
111b84000-111b88000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_r.bundle
111b88000-111b8c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_r.bundle
111b8c000-111b8d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_r.bundle
111b8d000-111b90000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_4.bundle
111b90000-111b94000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_4.bundle
111b94000-111b98000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_4.bundle
111b98000-111b9c000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_4.bundle
111b9c000-111b9d000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_4.bundle
111b9d000-111ba0000 rw- /usr/lib/dyld
111bac000-111c3f000 r-x /usr/lib/dyld
111c3f000-111c44000 r-- /usr/lib/dyld
111c44000-111c45000 rw- /usr/lib/dyld
111c45000-111c7a000 rw- /usr/lib/dyld
111c7a000-111cb2000 r-- /usr/lib/dyld
111cb2000-1121fe000 rw- /private/var/folders/c6/z14lbww55_v4wzrrz8df56yc0000gr/0/com.apple.LaunchServices.dv/com.apple.LaunchServices-1082-v2.csstore
1121fe000-11253e000 r-- /System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/Assets.car
11253e000-112542000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1250.bundle
112542000-112546000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1250.bundle
112546000-11254a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1250.bundle
11254a000-11254b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1250.bundle
11254b000-11254e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_5.bundle
11254e000-112552000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_5.bundle
112552000-112556000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_5.bundle
112556000-11255a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_5.bundle
11255a000-11255b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_5.bundle
11255b000-11255e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1251.bundle
11255e000-112562000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1251.bundle
112562000-112566000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1251.bundle
112566000-11256a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1251.bundle
11256a000-11256b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1251.bundle
11256b000-11256e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_6.bundle
11256e000-112572000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_6.bundle
112572000-112576000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_6.bundle
112576000-11257a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_6.bundle
11257a000-11257b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_6.bundle
11257b000-11257e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_u.bundle
11257e000-112582000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_u.bundle
112582000-112586000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_u.bundle
112586000-11258a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_u.bundle
11258a000-11258b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/koi8_u.bundle
11258b000-11258e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1252.bundle
11258e000-112592000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1252.bundle
112592000-112596000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1252.bundle
112596000-11259a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1252.bundle
11259a000-11259b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1252.bundle
11259b000-11259e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_7.bundle
11259e000-1125a2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_7.bundle
1125a2000-1125a6000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_7.bundle
1125a6000-1125aa000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_7.bundle
1125aa000-1125ab000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_7.bundle
1125ab000-1125ae000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1253.bundle
1125ae000-1125b2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1253.bundle
1125b2000-1125b6000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1253.bundle
1125b6000-1125ba000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1253.bundle
1125ba000-1125bb000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1253.bundle
1125bb000-1125be000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_8.bundle
1125be000-1125c2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_8.bundle
1125c2000-1125c6000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_8.bundle
1125c6000-1125ca000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_8.bundle
1125ca000-1125cb000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_8.bundle
1125cb000-1125ce000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_9.bundle
1125ce000-1125d2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_9.bundle
1125d2000-1125d6000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_9.bundle
1125d6000-1125da000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_9.bundle
1125da000-1125db000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/iso_8859_9.bundle
1125db000-1125de000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1254.bundle
1125de000-1125e2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1254.bundle
1125e2000-1125e6000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1254.bundle
1125e6000-1125ea000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1254.bundle
1125ea000-1125eb000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1254.bundle
1125eb000-1125ee000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_31j.bundle
1125ee000-1125f2000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_31j.bundle
1125f2000-1125f6000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_31j.bundle
1125f6000-1125fa000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_31j.bundle
1125fa000-1125fb000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_31j.bundle
1125fb000-1125fe000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1257.bundle
1125fe000-112602000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1257.bundle
112602000-112606000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1257.bundle
112606000-11260a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1257.bundle
11260a000-11260b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/windows_1257.bundle
11260b000-11260e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/shift_jis.bundle
11260e000-112612000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/shift_jis.bundle
112612000-112616000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/shift_jis.bundle
112616000-11261a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/shift_jis.bundle
11261a000-11261b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/shift_jis.bundle
11261b000-11261e000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/gbk.bundle
11261e000-112622000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/gbk.bundle
112622000-112626000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/gbk.bundle
112626000-11262a000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/gbk.bundle
11262a000-11262b000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/enc/gbk.bundle
11262b000-11262e000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.bundle
11262e000-112632000 r-x /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.bundle
112632000-112636000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.bundle
112636000-11263a000 rw- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.bundle
11263a000-11263d000 r-- /Users/andy/.rvm/gems/ruby-3.0.2@glimmer-dsl-tk/gems/psych-4.0.2/lib/psych.bundle
11263d000-11263e000 rw- /usr/local/Cellar/libyaml/0.2.5/lib/libyaml-0.2.dylib
11263e000-112656000 r-x /usr/local/Cellar/libyaml/0.2.5/lib/libyaml-0.2.dylib
112656000-112657000 r-- /usr/local/Cellar/libyaml/0.2.5/lib/libyaml-0.2.dylib
112657000-112658000 rw- /usr/local/Cellar/libyaml/0.2.5/lib/libyaml-0.2.dylib
112658000-11265c000 r-- /usr/local/Cellar/libyaml/0.2.5/lib/libyaml-0.2.dylib
11265c000-112660000 r-x /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/strscan.bundle
112660000-112664000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/strscan.bundle
112664000-112668000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/strscan.bundle
112668000-11266a000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/ruby/3.0.0/x86_64-darwin19/strscan.bundle
11266a000-11266c000 rw- /System/Library/Fonts/Supplemental/Courier New.ttf
11266c000-112714000 r-- /System/Library/Fonts/Supplemental/Courier New.ttf
112714000-112815000 r-- /System/Library/Keyboard Layouts/AppleKeyboardLayouts.bundle/Contents/Resources/AppleKeyboardLayouts-L.dat
112815000-112916000 rw- /System/Library/Keyboard Layouts/AppleKeyboardLayouts.bundle/Contents/Resources/AppleKeyboardLayouts-L.dat
112916000-112a1d000 r-- /System/Library/Keyboard Layouts/AppleKeyboardLayouts.bundle/Contents/Resources/AppleKeyboardLayouts-L.dat
112a1d000-112c5c000 r-- /System/Library/Fonts/Helvetica.ttc
112c5c000-112fe1000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
112fe1000-113366000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
113366000-1136eb000 rw- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
1136eb000-113a98000 r-- /Users/andy/.rvm/rubies/ruby-3.0.2/lib/libruby.3.0.dylib
113a98000-115321000 r-- /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
115321000-1161b6000 r-- /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
1161b6000-116631000 r-- /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
116631000-116776000 r-- /Library/Frameworks/Tk.framework/Versions/8.6/Tk
116776000-1168d7000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bc5f000-70000bc60000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bc60000-70000bce2000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bce2000-70000bce3000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bce3000-70000bd65000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bd65000-70000bd66000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bd66000-70000bde8000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000be6b000-70000be6c000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000be6c000-70000beee000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000beee000-70000beef000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000beef000-70000bf00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bf00000-70000bf01000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bf01000-70000bf83000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bf83000-70000bf84000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
70000bf84000-70000c186000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935b400000-7f935b500000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935b500000-7f935b600000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935b600000-7f935b700000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935b700000-7f935b800000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935b800000-7f935c000000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c000000-7f935c800000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c800000-7f935c81b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c81b000-7f935c91b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c91b000-7f935c92b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c92b000-7f935c98b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c98b000-7f935c98c000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935c990000-7f935e990000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935e990000-7f935e99c000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935e99c000-7f935e9b4000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935e9b4000-7f935e9c3000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935e9e0000-7f935ea19000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ea19000-7f935ea52000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ea52000-7f935ea82000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ea82000-7f935eaf3000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935eaf3000-7f935eafd000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935eb00000-7f935ec00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ec00000-7f935ed00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ed00000-7f935ed1d000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ed1d000-7f935ed3b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ed3b000-7f935ee0b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ee0b000-7f935ef0d000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef0d000-7f935ef27000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef2a000-7f935ef3b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef3b000-7f935ef50000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef50000-7f935ef69000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef69000-7f935ef81000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef81000-7f935ef97000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935ef97000-7f935efaf000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935efaf000-7f935efd2000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935efd2000-7f935effe000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935f000000-7f935f800000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f935f800000-7f9360000000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360000000-7f9360100000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360100000-7f9360200000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360200000-7f9360300000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360300000-7f9360400000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360400000-7f9360500000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360500000-7f9360600000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360600000-7f9360700000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360700000-7f9360800000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9360800000-7f9361000000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361000000-7f9361100000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361100000-7f9361201000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361201000-7f9361302000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361302000-7f9361403000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361403000-7f9361444000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361444000-7f9361486000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361486000-7f93614c8000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f93614c8000-7f936150a000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f936150a000-7f936160b000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f936160b000-7f936170c000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f936170c000-7f936180e000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f936180e000-7f9361910000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361921000-7f9361932000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361932000-7f9361952000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361952000-7f9361972000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361972000-7f9361992000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361a00000-7f9361b00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361b00000-7f9361c8c000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361c8c000-7f9361e18000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361e18000-7f9361fa4000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7f9361fa4000-7f9362130000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7ffedf0b7000-7ffee28b7000 --- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7ffee28b7000-7ffee30b7000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff00000000-7fff80000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff80000000-7fff87800000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff87800000-7fff87a00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff87a00000-7fff88800000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff88800000-7fff88a00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff88a00000-7fff88c00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff88c00000-7fff89c00000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff89c00000-7fff89e00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff89e00000-7fff8a000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8a000000-7fff8a200000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8a200000-7fff8a400000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8a400000-7fff8a600000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8a600000-7fff8a800000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8a800000-7fff8aa00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8aa00000-7fff8ac00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8ac00000-7fff8ae00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8ae00000-7fff8b000000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8b000000-7fff8b200000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8b200000-7fff8b400000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8b400000-7fff8c000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8c000000-7fff8c200000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8c200000-7fff8c400000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8c400000-7fff8dc00000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8dc00000-7fff8de00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8de00000-7fff8e000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8e000000-7fff8e200000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8e200000-7fff8e800000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8e800000-7fff8ea00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8ea00000-7fff8fa00000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8fa00000-7fff8fc00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8fc00000-7fff8fe00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff8fe00000-7fff90000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff90000000-7fff90200000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff90200000-7fff90800000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff90800000-7fff90a00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff90a00000-7fff91e00000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff91e00000-7fff92000000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92000000-7fff92200000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92200000-7fff92400000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92400000-7fff92600000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92600000-7fff92800000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92800000-7fff92a00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92a00000-7fff92c00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff92c00000-7fff93000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93000000-7fff93200000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93200000-7fff93400000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93400000-7fff93600000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93600000-7fff93800000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93800000-7fff93c00000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93c00000-7fff93e00000 rw- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fff93e00000-7fffc0000000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fffc0000000-7fffffe00000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fffffe00000-7fffffe01000 r-- /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
7fffffe5a000-7fffffe5b000 r-x /Library/Frameworks/Tcl.framework/Versions/8.6/Tcl
[IMPORTANT]
Don't forget to include the Crash Report log file under
DiagnosticReports directory in bug reports.

```

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
