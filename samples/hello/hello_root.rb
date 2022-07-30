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

require 'glimmer-dsl-tk'

include Glimmer

root { |r|
  title 'Hello, Root!'
  icon_photo File.expand_path('../../icons/glimmer.png', __dir__)
  width 400
  height 200
  x -150
  y 300
  resizable true # same as `resizable true, true`, meaning cannot resize horizontally and vertically
  minsize 200, 100
  maxsize 600, 400
  background 'lightgrey'
  alpha 0.85 # on the mac, you can set `transparent true` as well
  topmost true
  
  on('OPEN_WINDOW') do # custom event that runs right after Tk.mainloop
    message_box(parent: r, title: 'Hi', message: 'Hi')
  end
  
  on('DELETE_WINDOW') do |event| # alias for WM_DELETE_WINDOW protocol event
    message_box(parent: r, title: 'Bye', message: 'Bye')
    exit(0)
  end
}.open
