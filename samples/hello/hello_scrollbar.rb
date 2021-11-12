# Copyright (c) 2020-2021 Andy Maleh
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

root { |main_window|
  title 'Hello, Scrollbar!'
  width 400
  height 300
  background 'green'
  
  @scrollbar_frame = scrollbar_frame {
    grid sticky: 'nsew', row: 0, column: 0, row_weight: 1, column_weight: 1
    
    10.times do |row|
      10.times do |column|
        button {
          grid row: row, column: column, column_weight: 0
          text "Row #{row} | Column #{column}"
        }
      end
    end
    
#     xscrollcommand do |*args|
#       @xscrollbar&.tk&.set(*args)
#     end
#
#     yscrollcommand do |*args|
#       @yscrollbar&.tk&.set(*args)
#     end
  }
  
#   @yscrollbar = scrollbar {
#     grid row: 0, column: 1
    # orient 'vertical' # default
#     command do |*args|
#       pd args
#       pd frame_bbox = TkGrid.bbox(main_window.tk, 0, 0)
#       height = frame_bbox[3]
#       @y_position = @y_position.to_i + 1 # args.first.to_i
#       pd (@y_position.abs / height.to_f).to_s
#       @yscrollbar.tk.set((@y_position.abs / height.to_f).to_s, ((@y_position.abs / height.to_f) + 0.01).to_s)
#       @frame.tk.place x: @x_position.to_i, y: @y_position.to_i
#       @scrolledframe.scrolledframe_tk.yview(*args)
#     end
#   }
#   @scrolledframe.scrolledframe_tk.yscrollbar @yscrollbar
   
#   @xscrollbar = scrollbar {
#     grid row: 1, column: 0, column_span: 2, row_weight: 0
#     orient 'horizontal'
#     command do |*args|
#       pd args
#       pd frame_bbox = TkGrid.bbox(main_window.tk, 0, 0)
#       width = frame_bbox[2]
#       @x_position = @x_position.to_i + 1 # args.first.to_i
#       @xscrollbar.tk.set((@x_position.abs / width.to_f).to_s, ((@x_position.abs / width.to_f) + 0.01).to_s)
#       @frame.tk.place x: @x_position.to_i, y: @y_position.to_i
#       @scrolledframe.scrolledframe_tk.xview(*args)
#     end
#   }
#   @scrolledframe.scrolledframe_tk.xscrollbar @xscrollbar

  
}.open
