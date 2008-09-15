# TODO: Should allow data or url

class Image < Post

  property :url, String, { :nullable => false }
  property :name, String
  property :description, Text, { :lazy => false }
  property :links_to, String

end
