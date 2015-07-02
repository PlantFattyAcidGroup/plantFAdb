module ApplicationHelper
  # Hash of items for top navigation links
  # Each key has an array of link, [matching controller symbols]
  def top_navbar_items
    {
      plants: [plants_path,[:plants]],
      publications: [publications_path,[:publications]],
      parameters: [parameters_path, [:parameters]],
      triacylglycerols: [triacylglycerols_path, [:triacylglycerols]],
      tocopherols: [tocopherols_path, [:tocopherols]],
      sterols: [sterols_path, [:sterols]],
      fatty_acids: [fatty_acids_path, [:fatty_acids]],
      all_measured_results: [results_path,[:results]]
    }
  end
  # return top nav bar html
  # set the active class for any items matching the controller name
  def application_top_navbar_items
    content_tag( :ul, id: "top-navigation") do
      top_navbar_items.collect{ |k,v|
        content_tag :li, link_to(k.to_s.titleize,v[0], class: ('active' if v[1].find{|key| params[:controller] =~ /#{key}/}) )
      }.join.html_safe + ''
      #((current_user && current_user.is_admin?) ? content_tag(:li, link_to("Admin", admin_root_path, class: ('active' if params[:controller]=~/^admin/))) : '')
    end
  end
end
