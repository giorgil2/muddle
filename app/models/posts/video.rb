# TODO: Should allow data or url

class Video < Post

  # property :url, String
  property :description, Text, { :lazy => false }
  property :link, String, { :nullable => false }
  property :name, String

end
