# example
#   person a: something dumb
#   person b: that was dumb

class Chat < Post

  property :title, String
  property :dialogue, Text, { :lazy => false, :nullable => false }

end
