## activeadmin-mongoid-reorder

Helper method to add reorder rows functionality to active admin index table view

## Setup

1. Add gem to Gemfile:

```gem activeadmin-mongoid-reorder```

2. Add ```Monogoid::Reorder``` to the model declaration you want to be reordarable. This will add ```reorder_objects``` class method, ```_position``` field and set default sorting order to ```:_position => :desc``` - so haviest goes first.

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

3. To the end of admin registration method of each reordarable model add the following generic helper:
```
collection_action :reorder, :method => :put do
  render :text => resource_class.reorder_objects(params[:ids])
end
```

4. And finally enable sorting js functionality. jQuery-ui is included by activeadmin by default, so all you need is to include this code in ```active_admin.js.coffee```:
```
$("#pages tbody")
  .sortable(sortable_options("/admin/pages/reorder"))
  .disableSelection()
```
Replace ```pages``` with the models name.

## The End

Finally having reordarable index table it's better to disable tables ordering options in the header.
