# TODO: Add comments/replies in the form of threaded posts?
# TODO: pagination, instead of a set amount per day, have each page be one days worth?
# TODO: via links to credit sources
# TODO: should not allow creation of audio/image/video without an attached file or link

class Posts < Application

  before :ensure_authenticated, :exclude => [:index, :show]

  PER_PAGE = 10

  def create
    type = params[:type].downcase
    @post = Object.const_get(:"#{params[:type]}").new(params[type])
    @file = params[type].delete(:file)
    @post.name = @file['filename'] if @file && !@file.empty?
    if @post.save
      @post.add_attachment(@file['tempfile'], { :content_type => @file['content_type'], :name => @post.attachment_name }) if @file && !@file.empty?
      redirect(url(:post, @post.id), :message => 'Post created')
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
    if params[:after]
      options.merge!({ :startkey => params[:after], :skip => 1 })
    elsif params[:before]
      options.merge!({ :startkey => params[:before], :skip => 1, :descending => false })
    end
    @posts = Post.by_date(options)
    @total_posts = @posts.total_rows
    @posts = @posts.to_a.reverse if params[:before]
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
    type = @post.couchdb_type.name.downcase
    if (@file = params[type].delete(:file)) && !@file.empty?
      @post.add_attachment(@file['tempfile'], { :content_type => @file['content_type'], :name => @post.attachment_name })
      params[type][:name] = @file['filename']
    end

    if @post.update_attributes(params[type]) || !@post.dirty?
      redirect url(:post, @post.id), :message => 'Post updated'
    else
      render :edit
    end
  end

end
