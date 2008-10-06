# TODO: Add comments/replies in the form of threaded posts?
# TODO: pagination, instead of a set amount per day, have each page be one days worth?

class Posts < Application

  PER_PAGE = 1

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
    options = { :count => PER_PAGE, :descending => true }
    if params[:next]
      options.merge!({ :startkey => params[:next], :skip => 1 })
    elsif params[:previous]
      options.merge!({ :startkey => params[:previous], :skip => 1, :descending => false })
    end
    @posts = Post.by_date(options)
    @total_posts = @posts.total_rows
    @posts = @posts.to_a.reverse if params[:previous]
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
