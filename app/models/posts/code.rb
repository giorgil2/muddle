class Code < Post

  property :code, Text, { :lazy => false, :nullable => false }
  property :description, Text, { :lazy => false }

end
