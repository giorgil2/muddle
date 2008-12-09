# TODO: post out to twitter

class Status < Post

  property :status, String, { :length => 140, :nullable => false }

end