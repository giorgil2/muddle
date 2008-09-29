require 'dm-types'

class Post

  include DataMapper::Resource
  property :id, String, { :key => true, :field => :_id, :nullable => true }
  property :rev, String, :field => :_rev
  property :attachments, JsonObject, :field => :_attachments
  property :post_type, Discriminator
  property :created_at, DateTime
  property :updated_at, DateTime

  def attachment_name
    self.post_type.name.downcase
  end

  def css_class
    case self.post_type.name
    when 'Link'
      'xfolkentry post'
    when 'Review'
      'hreview post'
    else
      'post'
    end
  end

end
