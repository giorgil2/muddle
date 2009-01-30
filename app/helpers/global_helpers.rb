module Merb
  module GlobalHelpers

    if File.exists?(File.join(Merb.root, '..', '..', 'shared', 'analytics'))
      def analytics
        @analytics ||= File.read(File.join(Merb.root, '..', '..', 'shared', 'analytics')).rstrip
      end
    else
      def analytics
        ''
      end
    end

  end
end
