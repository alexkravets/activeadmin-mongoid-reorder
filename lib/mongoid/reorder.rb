module Mongoid::Reorder
  extend ActiveSupport::Concern

  included do
    field :_position, :type => Float, :default => 0.0
    default_scope order_by(:_position => :desc)
  end

  module ClassMethods
    def reorder_objects(ids)
      objects = self.unscoped.find(ids)
      max_weight = (objects.max { |a,b| a._position <=> b._position })._position
      min_weight = (objects.min { |a,b| a._position <=> b._position })._position

      if max_weight.nil? or max_weight == 0
        max_weight = 100
      end

      if min_weight.nil?
        min_weight = 0
      end

      weight_delta  = (max_weight - min_weight) / objects.size
      objects_dict  = {}
                      objects.each { |o| objects_dict[o.id.to_s] = o }
      weights       = []

      ids.each_with_index do |id, index|
        position  = max_weight - index * weight_delta
        objects_dict[id].update_attributes!(_position: position)
      end

      "ok"
    end
  end
end