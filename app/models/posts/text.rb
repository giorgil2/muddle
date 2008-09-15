class Text < Post

  property :title, String
  property :body, Text, { :lazy => false, :nullable => false }

end
