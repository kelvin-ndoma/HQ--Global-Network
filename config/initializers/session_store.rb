if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, 
      key: "_global_nerwork_website", 
      domain: :all, 
      tld_length: 2, 
      expire_after: 30.days # Session cookie will last for 30 days in production
  else
    Rails.application.config.session_store :cookie_store, 
      key: "_global_nerwork_website", 
      expire_after: 14.days # Session cookie will last for 14 days in development (or use any duration you'd prefer)
  end
  