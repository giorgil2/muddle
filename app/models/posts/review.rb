class Review < Post

  property :rating, Integer, { :nullable => false }
  property :title, String, { :nullable => false }
  property :link, String
  property :description, Text, { :lazy => false }

end
