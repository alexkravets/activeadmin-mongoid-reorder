module ActiveAdmin
  module Views
    class IndexAsReorderTable < ActiveAdmin::Views::IndexAsTable
      def build(page_presenter, collection)
        table_options = {
          #:id => active_admin_config.resource_name.plural,
          # for some reason here plural is missing
          :id => active_admin_config.resource_name.pluralize.downcase,
          :sortable => false,
          :class => "index_table index reorder",
          :i18n => active_admin_config.resource_class,
          :paginator => page_presenter[:paginator] != false
        }

        table_for collection, table_options do |t|
          table_config_block = page_presenter.block || default_table
          instance_exec(t, &table_config_block)
        end
      end
    end
  end
end