Rails.application.config.session_store :cookie_store, key: '_global_network_website', same_site: :lax, secure: Rails.env.production?
