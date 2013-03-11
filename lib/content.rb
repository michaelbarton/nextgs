def increase_markdown_header(line)
  line[0] == '#' ? line.prepend('#') : line
end

def anchor(text,id)
  "<h3 id='#{id}'>#{text}</h3>"
end

def image(url,width=400)
  "<img src='#{relative_path_to(url)}' width=#{width}>"
end
