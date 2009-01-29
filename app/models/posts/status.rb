class Status < Post

  property :status, String, { :length => 140, :nullable => false }
  property :url, String

  # Twitter
  def send_to(params)
    return if params[:twitter_username].blank? || params[:twitter_password].blank?
    username, password = params[:twitter_username], params[:twitter_password]
    request = Net::HTTP::Post.new('/statuses/update.json', { 'User-Agent' => 'muddle' })
    request.basic_auth(username, password)
    request.set_form_data({ :status => self.status})
    response, data = Net::HTTP.new('twitter.com', 80).start {|http| http.request(request)}
    data = JSON.parse(data)
    self.url = "http://twitter.com/#{username}/status/#{data['id']}"
  end

end