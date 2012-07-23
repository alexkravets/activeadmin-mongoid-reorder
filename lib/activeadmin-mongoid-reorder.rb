require 'mongoid/reorder'
require 'active_admin/views/index_as_reorder_table'

module ActiveAdmin
  module Mongoid
    module Reorder
      require "activeadmin-mongoid-reorder/engine"
    end
  end
end