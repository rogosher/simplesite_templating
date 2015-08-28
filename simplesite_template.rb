# Author: Rogosher

##
# App configuration
##

# Install the bootstrap gem.
gem 'bootstrap-sass', github:'twbs/bootstrap-sass', branch:'master'

# Run bundle install.
run 'bundle install'

# Generate a simple landing page.
generate 'controller welcome index'
# Add a route to the page.
route "root to: 'welcome#index'"

# Installation steps for bootstrap

# Rename application stylesheet for sass
run 'mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss'
# Remove unecessary requires. User bootstrap @import.
gsub_file "app/assets/stylesheets/application.scss", / \*= require_tree .\n/, ''
gsub_file "app/assets/stylesheets/application.scss", / \*= require_self\n/, ''
# Add boostrap dependencies
inject_into_file "app/assets/stylesheets/application.scss", 
  "\n@import \"bootstrap-sprockets\";" \ # sprockets before bootstrap
  "\n@import \"bootstrap\";" \
  "\n@import \"partials/header\";\n",    # Simplesite header stylesheet
  :before => /\z/
# Javascript portion of bootstrap.
inject_into_file "app/assets/javascripts/application.js", "//= require bootstrap-sprockets\n", :before => /\z/

##
# Simplesite layout
##

# Inject custom view and stylesheet.
run 'cp -r ../app_assets/app .'

# Download and unzip font to app/assets/fonts/
font_name = 'caviar-dreams'
font_dir = 'app/assets/fonts'
font_file = "#{font_dir}/#{font_name}.zip"
font_url = "http://www.fontsquirrel.com/fonts/download/#{font_name}"

run "mkdir #{font_dir}"
run "curl -sS #{font_url} > #{font_file}"
run "unzip #{font_file} -d #{font_dir}"
run "rm #{font_file}"
