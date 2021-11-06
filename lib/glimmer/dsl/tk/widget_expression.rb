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
require 'glimmer/dsl/parent_expression'

module Glimmer
  module DSL
    module Tk
      class WidgetExpression < Expression
        include ParentExpression
  
        EXCLUDED_KEYWORDS = %w[root]
  
        def can_interpret?(parent, keyword, *args, &block)
          !EXCLUDED_KEYWORDS.include?(keyword) and
            Glimmer::Tk::WidgetProxy.widget_exists?(keyword) and
            (parent.respond_to?(:tk) or args.first.respond_to?(:tk))
        end
  
        def interpret(parent, keyword, *args, &block)
          if keyword == 'toplevel' && args.first.respond_to?(:tk)
            parent = args.first
            args[0] = args.first.tk
          end
          Glimmer::Tk::WidgetProxy.create(keyword, parent, args, &block)
        end
        
        def add_content(parent, keyword, *args, &block)
          super
          parent.post_add_content
        end
        
      end
    end
  end
end

require 'glimmer/tk/widget_proxy'
