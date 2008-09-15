class Link < Post

  property :name, String
  property :url, String, { :nullable => false }
  property :description, Text, { :lazy => false }

end
