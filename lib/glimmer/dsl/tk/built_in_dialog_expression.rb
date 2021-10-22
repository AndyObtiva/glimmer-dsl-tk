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

require 'glimmer'
require 'glimmer/dsl/expression'

module Glimmer
  module DSL
    module Tk
      class BuiltInDialogExpression < Expression
        def can_interpret?(parent, keyword, *args, &block)
          keyword = "get_#{keyword}" if keyword.start_with?('open')
          (keyword.start_with?('get') or keyword.start_with?('choose')) and
          (
            (block.nil? and ::Tk.respond_to?(keyword.camelcase)) or
            keyword == 'choose_font'
          )
        end
  
        def interpret(parent, keyword, *args, &block)
          if args.first.is_a?(Hash)
            options = args.first.symbolize_keys
            options[:filetypes] = options.delete(:file_types) if options.keys.include?(:file_types)
            options[:filetypes] = options[:filetypes].map { |key, value| "{#{key}} {#{value}}" } if options[:filetypes].is_a?(Hash)
            args[0] = options
          end
          keyword = "get_#{keyword}" if keyword.start_with?('open') || keyword.start_with?('save') || keyword.start_with?('multiple')
          if keyword == 'choose_font'
            TkFont::Fontchooser.configure(:font => args, :command => block)
            TkFont::Fontchooser.show
          else
            ::Tk.send(keyword.camelcase, *args)
          end
        end
      end
    end
  end
end
