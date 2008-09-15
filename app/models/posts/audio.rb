# TODO: Should allow data or url

class Audio < Post

  property :url, String
  property :description, Text, { :lazy => false }

end
