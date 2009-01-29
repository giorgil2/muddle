# TODO: CouchDB returns incorrect Content-Length headers (0)?

class Post
  include DataMapper::CouchResource
  property :created_at, DateTime
  property :updated_at, DateTime

  def attachment_name
    self.couchdb_type.name.downcase
  end

  # Used by particular services to send contents to other services
  def send_to(params)
    nil
  end

  def self.default_repository_name
    :couch
  end

  repository(:mysql) do
    belongs_to :user
  end

  # view :by_question_id, { "map" => "function(doc) { if (doc.couchdb_type == 'answer') emit(doc.question_id, doc) }"}
  view(:by_date) {{ "map" => "function(doc) { if (#{couchdb_types_condition}) { emit(doc.created_at, doc); } }" }}

end
