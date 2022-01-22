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

module Glimmer
  module Tk
    DragAndDropEvent = Struct.new(:source, :target, :tooltip, :x_root, :y_root, :data, :drop_accepted) do
      alias drop_accepted? drop_accepted
      
      def as_json(*)
        klass = self.class.name
        {
          JSON.create_id => klass,
          "v" => [values[0].object_id, values[1].object_id, values[2].object_id].concat(values.drop 3),
        }
      end

      def to_json(*args)
        as_json.to_json(*args)
      end

      def self.json_create(object)
        new(*[ObjectSpace._id2ref(object["v"][0]), ObjectSpace._id2ref(object["v"][1]).proxy, ObjectSpace._id2ref(object["v"][2])].concat(object["v"].drop 3))
      end
    end
  end
end
