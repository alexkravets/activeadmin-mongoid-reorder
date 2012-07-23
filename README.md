## activeadmin-mongoid-reorder

Helper method to add reorder rows functionality to active admin index table view.

## Setup

Add gem to Gemfile:

```gem activeadmin-mongoid-reorder```

Add ```Monogoid::Reorder``` to the model declaration you want to be reordarable. This will add ```reorder_objects``` class method, ```_position``` field and set default sorting order to ```:_position => :desc``` - so haviest goes first.

Example:
```
class Page
  include Mongoid::Document
  include Mongoid::Reorder

  # Fields
  field :title,     :type => String
  field :content,   :type => String
end
```

To the end of admin registration method of each reordarable model add the following generic helper:
```
collection_action :reorder, :method => :put do
  render :text => resource_class.reorder_objects(params[:ids])
end
```

Reorder table type should be specified for ```index``` view, here is an example how this should look like:

```
index :as => :reorder_table do
  column :title
  default_actions
end
```

And finally enable sorting js functionality. jQuery-ui is included by activeadmin by default, so all you need is to include ```activeadmin_reoder_table``` in ```active_admin.js.coffee```:

```#= require activeadmin_reorder_table```

## The End

That's it.
