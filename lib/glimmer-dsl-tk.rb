# Copyright (c) 2020-2022 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

# External requires
require 'glimmer'
# require 'logging'
require 'puts_debuggerer' if ENV['pd'].to_s.downcase == 'true'
# require 'super_module'
require 'tk'
#require 'tkextlib/bwidget' # does not work on Windows
#require 'tkextlib/iwidgets' # does not work on Windows
require 'facets/hash/symbolize_keys'
require 'facets/string/underscore'
require 'facets/string/camelcase'
require 'delegate'

# Internal requires
# require 'ext/glimmer/config'
# require 'ext/glimmer'
require 'glimmer/tk/os'
require 'glimmer/dsl/tk/dsl'

Glimmer::Config.loop_max_count = -1

Glimmer::Config.excluded_keyword_checkers << lambda do |method_symbol, *args|
  method = method_symbol.to_s
  result = false
  result ||= method == 'load_iseq'
end

::Tk::Tile::Style.theme_use 'clam' if OS.linux?

::TkOption.add '*tearOff', 0

class ::Tk::TkSysMenu_Window < ::Tk::Menu
  include ::Tk::SystemMenu
  SYSMENU_NAME = 'window'
end
