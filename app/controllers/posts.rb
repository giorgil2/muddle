# TODO: Add comments/replies in the form of threaded posts?
# TODO: pagination, instead of a set amount per day, have each page be one days worth?
# TODO: via links to credit sources
# TODO: should not allow creation of audio/image/video without an attached file or link

class Posts < Application

  before :ensure_authenticated, :exclude => [:index, :show]

  log_params_filtered :delicious_password, :twitter_password

  PER_PAGE = 10

  def create
    type = params[:type].downcase
    @file = params[type].delete(:file)
    @post = Object.const_get(:"#{params[:type]}").new(params[type])
    @post.name = @file['filename'] if @file && !@file.empty?

    # Send link to del.icio.us if we have credentials
    if !params[:delicious_username].blank? && !params[:delicious_password].blank?
      @post.send_to_delicious(params[:delicious_username], params[:delicious_password])
    end

    # Send status to twitter if we have credentials
    if !params[:twitter_username].blank? && !params[:twitter_password].blank?
      @post.send_to_twitter(params[:twitter_username], params[:twitter_password])
    end

    if @post.save
      @post.add_attachment(@file['tempfile'], { :content_type => @file['content_type'], :name => @post.attachment_name }) if @file && !@file.empty?
      redirect(url(:post, @post.id), :message => {:notice => 'Post created' })
    else
      render :new
    end
  end

  def delete
    @post = Post.get!(params[:id])
    @post.destroy
    redirect(url(:posts), :message => { :notice => 'Post deleted' })
  end

  def edit
    @post = Post.get!(params[:id])
    render
  end

  def index
    provides :atom
    options = { :descending => true, :limit => PER_PAGE }
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
      redirect url(:post, @post.id), :message => { :notice => 'Post updated' }
    else
      render :edit
    end
  end

  def attachment
    @post = Post.get!(params[:post_id])
    return unless @post.attachments
    file = open("http://localhost:5984/#{repository(:couch).adapter.escaped_db_name}/#{@post.id}/#{@post.attachment_name}")
    stream_file({
      :content_length => @post.attachments[@post.attachment_name]['length'],
      :filename => @post.name,
      :type => @post.attachments[@post.attachment_name]['content_type']
    }) do |response|
      while(chunk = file.read(16384))
        response.write(chunk)
      end
    end
  end

end
