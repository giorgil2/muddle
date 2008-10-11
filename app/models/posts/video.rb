# TODO: Setup for flv's
# TODO: Should allow data or url

class Video < Post

  property :title, String
  property :description, Text, { :lazy => false }
  property :name, String

end
