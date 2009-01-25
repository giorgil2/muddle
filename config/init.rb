$KCODE = 'UTF8'

# Go to http://wiki.merbivore.com/pages/init-rb

require 'config/dependencies.rb'

use_orm :datamapper
use_test :rspec
use_template_engine :erb

Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper

  # cookie session store configuration
  c[:session_secret_key]  = '2ba11c91acaa954ea631293e48e2c515be15b4c0'  # required for cookie session store
  # c[:session_id_key] = '_session_id' # cookie session id key, defaults to "_session_id"

  # TODO: use this setting instead of monkey-patch after point release.
  # Merb::Plugins.config[:merb_datamapper][:use_repository_block] = false
end

Merb::BootLoader.after_app_loads do
  # Add dependencies here that must load after the application loads:

  # FIXME: monkey-patch to prevent merb_datamapper repository blocks, remove after point release
  class Application < Merb::Controller
    override! :_call_action
    def _call_action(*)
      super
    end
  end
end

Merb.add_mime_type(:atom, :to_atom, %w[application/atom+xml])
