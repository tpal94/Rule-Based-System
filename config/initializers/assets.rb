# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( strategy_validation.js main.css util.css custom.css custom5.css custom2.css product_strategy.css custom8.css custom14.css custom9.css easy-responsive-tabs.css easyResponsiveTabs.js)
