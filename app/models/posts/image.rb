# TODO: Should allow data or url
# TODO: tags
# TODO: Post to flickr?

class Image < Post

  # property :url, String, { :nullable => false }

  property :title, String
  property :description, Text, { :lazy => false }
  property :name, String

end
