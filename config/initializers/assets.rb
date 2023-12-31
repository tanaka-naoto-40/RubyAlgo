# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap-icons/font")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[admin.css]
Rails.application.config.assets.precompile += %w[monokai.css]
Rails.application.config.assets.precompile += %w[simple_calendar.scss]
Rails.application.config.assets.precompile += %w[script.js]
Rails.application.config.assets.precompile += %w[ruby_wasm_interface.js]
