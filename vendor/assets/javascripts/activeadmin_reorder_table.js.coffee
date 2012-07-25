if !Array.prototype.last
  Array.prototype.last = () -> return this[this.length - 1]

$ ->
  window.sortable_options = (url) ->
    options =
      stop: (e, ui) ->
        # Select object ids from the table rows
        # -------------------------------------
        ids = []                
        $(this).find('tr').each ->
          id_attr = $(this).attr('id')
          if id_attr
            id      = id_attr.split("_").last()
            ids.push(id)
        
        params =
          ids:                ids
          _method:            "put"
          authenticity_token: $('meta[name=csrf-token]').attr('content')
        
        $.post url, params, (data) ->
          if data != "ok"
            alert 'Error happended. Please contact devs.'
    return options

  reorder_table = $(".index_table.reorder")

  if reorder_table.length > 0
    id = reorder_table.attr('id') 
    reorder_method_url = "/admin/#{id}/reorder"
    
    reorder_table.find("tbody")
      .sortable(sortable_options(reorder_method_url))
      .disableSelection()