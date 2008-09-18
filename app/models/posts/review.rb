class Review < Post

  property :rating, Integer, { :nullable => false }
  property :title, String
  property :description, Text, { :lazy => false }

end
