class Link < Post

  property :name, String
  property :link, String, { :nullable => false }
  property :description, Text, { :lazy => false }

end
