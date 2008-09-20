require 'dm-types'

class Post

  include DataMapper::Resource
  property :id, String, { :key => true, :field => :_id, :nullable => true }
  property :rev, String, :field => :_rev
  property :attachments, JsonObject, :field => :_attachments
  property :post_type, Discriminator
  property :created_at, DateTime
  property :updated_at, DateTime

  # FIXME: The name isn't getting persisted?
  def file=(new_file)
    self.name = new_file['filename']
    @attachment = new_file
    self.add_attachment(new_file['tempfile'], { :content_type => new_file['content_type'], :name => self.post_type.storage_name })
  end

end
