class Posts < Application

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect url(:edit_post, @post), :message => 'Post created'
    else
      render :new
    end
  end

  def delete
    @post = Post.get!(params[:id])
    @post.destroy
    redirect url(:posts), :message => 'Post deleted'
  end

  def edit
    @post = Post.get!(params[:id])
    render
  end

  def index
    @posts = Post.all
    render
  end

  def new
    @post = Post.new
    render
  end

  def show
    @post = Post.get!(params[:id])
    render
  end

  def update
    @post = Post.get!(params[:id])
    if @post.update_attributes(params[:post])
      redirect url(:post, @post), :message => 'Post updated'
    else
      render :edit
    end
  end

end
