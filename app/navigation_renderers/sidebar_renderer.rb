class SidebarRenderer < SimpleNavigation::Renderer::List
  def tag_for(item)
    text = item.name
    if item.html_options.key?(:icon)
      text = %Q(
        <span class="glyphicon glyphicon-#{item.html_options[:icon]}"></span>
        #{text}
      ).html_safe
    end

    if suppress_link?(item)
      content_tag 'span', text, link_options_for(item).except(:method)
    else
      link_to(text, item.url, options_for(item))
    end
  end
end
