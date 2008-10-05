# TODO: Add comments/replies in the form of threaded posts?
# TODO: lookup posts with view
# TODO: pagination

class Posts < Application

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect(url(:edit_post, @post.id), :message => 'Post created')
    else
      render :new
    end
  end

  def delete
    @post = Post.get!(params[:id])
    @post.destroy
    redirect(url(:posts), :message => 'Post deleted')
  end

  def edit
    @post = Post.get!(params[:id])
    render
  end

  def index
    @posts = Post.all.sort_by {|x| x.created_at}.reverse
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

  # TODO: delete attachment when changing to url?
  def update
    @post = Post.get!(params[:id])

    if (@file = params[:post].delete(:file)) && !@file.empty?
      @post.add_attachment(@file['tempfile'], { :content_type => @file['content_type'], :name => @post.attachment_name })
      params[:post][:name] = @file['filename']
    end

    if @post.update_attributes(params[:post]) || !@post.dirty?
      redirect url(:post, @post.id), :message => 'Post updated'
    else
      render :edit
    end
  end

end
