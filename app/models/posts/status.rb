class Status < Post

  property :status, String, { :length => 140, :nullable => false }
  property :url, String

  def send_to_twitter(username, password)
    return unless self.valid?
    request = Net::HTTP::Post.new('/statuses/update.json', {})
    request.basic_auth(username, password)
    request.set_form_data({ :status => self.status})
    response, data = Net::HTTP.new('twitter.com', 80).start {|http| http.request(request)}
    data = JSON.parse(data)
    self.url = "http://twitter.com/#{username}/status/#{data['id']}"
  end

end