def youtube(id)
  h = 480
  w  = 853
  url = "http://www.youtube.com/embed/#{id}?vq=hd1080"
  "<iframe width='#{w}' height='#{h}' src='#{url}' frameborder='0'></iframe>"
end
