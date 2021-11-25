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
