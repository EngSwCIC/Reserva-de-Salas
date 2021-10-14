# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( header.js )
Rails.application.config.assets.precompile += %w( header.css )
Rails.application.config.assets.precompile += %w( login-register-form.css )
Rails.application.config.assets.precompile += %w( form-utils.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(1.jpg 2.jpg 3.jpg bin.png edit.png calendar.png)
