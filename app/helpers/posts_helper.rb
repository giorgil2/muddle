module Merb
  module PostsHelper

    def couch_uri
      "http://#{request.env['SERVER_NAME']}:5984"
    end

  end
end # Merb