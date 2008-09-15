class Posts < Application

  def index
    @posts = Post.all
    render
  end

end
