# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
      :associate_tag         => ENV['associate_tag'],
      :AWS_access_key_id     => ENV['AWS_access_key_id'],
      :AWS_secret_key        => ENV['AWS_secret_key']
}