module Merb
  module PostsHelper

    def attachment_url_for(post)
      "http://#{request.env['SERVER_NAME']}:5984" +
        post.attachment_path(post.attachment_name)
    end

  end
end # Merb