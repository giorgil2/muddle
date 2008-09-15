class Quote < Post

  property :quote, Text, { :lazy => false, :nullable => false }
  property :source, String

end
