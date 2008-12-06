# TODO: CouchDB returns incorrect Content-Length headers (0)?

class Post
  include DataMapper::CouchResource
  property :created_at, DateTime
  property :updated_at, DateTime

  def attachment_name
    self.couchdb_type.name.downcase
  end

  def self.default_repository_name
    :couch
  end

  repository(:mysql) do
    belongs_to :user
  end

  # view :by_question_id, { "map" => "function(doc) { if (doc.couchdb_type == 'answer') emit(doc.question_id, doc) }"}
  view :by_date, { "map" => "function(doc) { if (doc.couchdb_type == 'Post' || doc.couchdb_type == 'Audio' || doc.couchdb_type == 'Chat' || doc.couchdb_type == 'Code' || doc.couchdb_type == 'Image' || doc.couchdb_type == 'Link' || doc.couchdb_type == 'Quote' || doc.couchdb_type == 'Review' || doc.couchdb_type == 'Text' || doc.couchdb_type == 'Video') emit(doc.created_at, doc) }"}

end
