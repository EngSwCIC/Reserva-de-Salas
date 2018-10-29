# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'mail.google.com',
    :port           => 587,
    :user_name      => 'reservadesalas2@gmail.com',
    :password       => 'reservadesalas2018',
    :authentication => :plain
}