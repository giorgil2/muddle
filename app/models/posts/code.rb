# TODO: Syntax highlighting?

class Code < Post

  property :title, String
  property :code, Text, { :lazy => false, :nullable => false }
  property :description, Text, { :lazy => false }
  property :url, String

  # gist (requires setting global git config, see your github profile)
  def send_to(params)
    return if params[:gist_filename].blank?
    http = Net::HTTP.new('gist.github.com', 80)
    request = Net::HTTP::Post.new("/gists", { 'User-Agent' => 'muddle' })
    request.set_form_data({
      'file_ext[gistfile1]' => params[:gist_filename].split('.')[1],
      'file_name[gistfile1]' => params[:gist_filename].split('.')[0],
      'file_contents[gistfile1]' => self.code,
      'login' => `git config --global github.user`.strip,
      'token' => `git config --global github.token`.strip
    })
    response, data = http.start {|http| http.request(request)}
    self.url = response['location']
  end
end
