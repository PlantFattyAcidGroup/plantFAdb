module ApplicationHelper
  # Hash of items for top navigation links
  # Each key has an array of link, [matching controller symbols]
  def top_navbar_items
    {
      fatty_acids: [fatty_acids_path, [:fatty_acids]],
      tree: [tree_index_path,[:tree]],
      plants: [plants_path,[:plants,:species]],
      literature: [pubs_path,[:pubs]]
    }
  end
  # return top nav bar html
  # set the active class for any items matching the controller name
  def application_top_navbar_items
      top_navbar_items.collect{ |k,v|
        content_tag :li, link_to(k.to_s.titleize,v[0]), class: ('active' if v[1].find{|key| params[:controller] =~ /#{key}/} )
      }.join.html_safe
  end
  
  # table sort helper
  def sortable(column, title = nil)  
    title ||= column.titleize  
    icon = ""
    if column == sort_column
      if sort_direction=='asc'
        icon = " <i class='glyphicon glyphicon-triangle-top'/>"
      else
        icon = " <i class='glyphicon glyphicon-triangle-bottom'/>"
      end
    else
      icon = "#{image_tag "sort_off.png", style: 'display:inline-block', size: '10x10'}"
    end
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to (title+icon).html_safe, params.merge({sort: column, direction: direction}), style: 'white-space: nowrap'
  end
  
  # github style filters
  def dropdown_select label, param, array
    hsh_clear={}
    hsh_clear[param]=''
    html = "<li class='dropdown'>
			<a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>
				#{label} <span class='caret'></span>
			</a>
      <ul class='dropdown-menu'>
        <li>#{link_to 'Clear', params.merge(hsh_clear)}</li>
				<li role='separator' class='divider'></li>
    "
    array.each do |option|
      hsh={}
      if option.is_a? Array
        hsh[param]=option[1].to_s
        html += "<li>#{link_to ((params[param].to_s==option[1].to_s ? "<span class='glyphicon glyphicon-ok' style='margin-left:-18px'></span> " : '')+option[0]).html_safe, params.merge(hsh)}</li>"
      else
        hsh[param]=option
        html += "<li>#{link_to option, params.merge(hsh) }</li>"
      end
    end
    
    (html+"</ul></li>").html_safe
  end
  # pull left and give left padding
  def left_dropdown_select label, param, array
    "<div class='pull-left' style='margin-right:1em'> #{dropdown_select label, param, array} </div>".html_safe
  end
  # pull right and give right padding
  def right_dropdown_select label, param, array
    "<div class='pull-right' style='margin-left:1em'> #{dropdown_select label, param, array} </div>".html_safe
  end
end
