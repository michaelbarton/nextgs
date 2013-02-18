include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

def stylesheet(location, media = 'screen,projection')
  "<link href='#{location}' media='#{media}' rel='stylesheet' type='text/css'>"
end

def highlight
  "<pre class=\"class=prettyprint\">"
end

def endhighlight
  "</pre>"
end

def navigation_link(link)
  case link
  when /http/
    link
  else
    relative_path_to link
  end
end

def image(url,width=400)
  "<img src='#{relative_path_to(url)}' width=#{width}>"
end

def scripts
  return unless @site.config[:scripts]
  output = String.new
  @site.config[:scripts].each do |script|
    script = relative_path_to(script) unless script =~ /^http/
    output << "<script src='#{script}' type='text/javascript'></script>\n"
  end
  output
end

def stylesheets
  return unless @site.config[:stylesheets]
  output = String.new
  @site.config[:stylesheets].each do |sheet,media|
    sheet = sheet.to_s
    sheet = relative_path_to(sheet) unless sheet =~ /^http/
    output << stylesheet(sheet,media) + "\n"
  end
  output
end

def favicon
  if @site.config[:site][:favicon]
    return "<link href='#{@site.config[:site][:favicon]}' rel='shortcut icon' >"
  end
end

def site_title
 [@item[:title],@site.config[:site][:title],@site.config[:author][:name]].compact.uniq * " | "
end
