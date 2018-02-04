Synergene1::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  
  # config.paperclip_defaults = {
  #   :storage => :s3,
  #   :s3_region => "us-west-2",  
  #   :path => "/resources/:class/:id_partition/:style/:id-:basename.:extension",
  #   :s3_credentials => {
  #     :bucket => ENV["AWS_BUCKET"],
  #     :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
  #     :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
  #   }
  # }
  config.paperclip_defaults = {
    :storage => :s3,
    :bucket => ENV['AWS_BUCKET'],
    :s3_credentials => {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      s3_region: "us-east-1",
    },
    :url => ":s3_host_name",
    :s3_host_name => "s3.amazonaws.com",
    :path => "/:class/:id_partition/:style/:filename",
    :s3_protocol => :https
  }

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp



  config.assets.debug = true
   config.action_mailer.smtp_settings = {
     :address => "smtp.gmail.com",
     :port => 587,
     :authentication => :plain, # I've also tried changing this to :login
     :domain => "gmail.com",
     :user_name => ENV['GMAIL_USER'],
     :password => ENV['GMAIL_SECRET']
   }

end
