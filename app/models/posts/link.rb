class Link < Post

  property :url, String, { :nullable => false }
  property :title, String, { :nullable => false }
  property :description, Text, { :lazy => false, :nullable => false }
  property :tags, String

  before(:valid?) do
    unless @title && !@title.empty?
      doc = Hpricot(open(url))
      @title = doc.at('title').inner_html
    end
  end

  def send_to_delicious(username, password)
    return unless self.valid?
    http = Net::HTTP.new('api.del.icio.us', 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    query = { :description => self.description, :url => self.url }
    query[:tags] = self.tags if self.tags
    request = Net::HTTP::Post.new("/v1/posts/add", { 'User-Agent' => 'muddle' })
    request.basic_auth(username, password)
    request.set_form_data(query)
    response, data = http.start {|http| http.request(request)}
  end

end
