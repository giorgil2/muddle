class Code < Post

  property :title, String
  property :code, Text, { :lazy => false, :nullable => false }
  property :description, Text, { :lazy => false }

end
