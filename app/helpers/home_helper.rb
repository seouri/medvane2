module HomeHelper
  def dashboard(bibliome_stat)
    return if bibliome_stat.nil?
    th = []
    for item in %w(articles journals authors subjects genes) do
      link_text = number_with_delimiter(bibliome_stat.send("#{@period}_#{item}")) + "<br>".html_safe + item.capitalize
      link = link_to(link_text.html_safe, eval("#{@period}_#{item}_path"))
      th.push(content_tag(:th, link.html_safe, :width => "20%", :class => item))
    end
    tr = content_tag(:tr, th.join("\n").html_safe)
    table = content_tag(:table, tr, :width => "100%", :id => "summary")
    updated = "Last updated at #{bibliome_stat.created_at}"
    content_tag(:div, table + updated, :id => "dashboard")
  end
end
