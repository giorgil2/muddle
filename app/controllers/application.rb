class Application < Merb::Controller
  log_params_filtered :password, :password_confirmation
end