source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'

# Use postgresql as the database for Active Record
gem 'pg'
gem "pg_search"
gem "surus"
#gem "ar-uuid"
gem "foreigner"
gem 'annotate', :github => 'ctran/annotate_models'
gem 'rake','>= 10.4.2'
gem 'seed_migration'


# Used for authentication
gem "devise", "~> 3.5.2"
gem "devise-encryptable", "~> 0.2.0"
gem "devise-async", "~> 0.9.0"

# Way better than WEBrick
gem 'thin'

# Turns out, you need this for Heroku
group :production do
  gem 'rails_12factor'
end

# Have you tried this yet? Do it
group :development do
  gem "binding_of_caller"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # see better errors in rails
  gem 'better_errors'
  # for dev proxying
  gem "proxylocal"
  # Catch all mails on dev & test
  gem 'mailcatcher'
  gem 'factory_girl_rails'
  # app auditing
  gem 'brakeman', :require => false
  gem 'quiet_assets'
end
# Better testing
group :development, :test do
  gem 'rspec-rails', '>= 3.0.0'
  gem 'shoulda-matchers', require: false
  gem 'test_after_commit'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'valid_attribute'
  gem 'wisper-rspec', require: false
  gem 'timecop'
  gem "fakeweb"
  gem 'rspec_api_helpers'
end
# Bind that shit
gem 'pry'
# Ugh
#gem 'jwt'

gem 'omniauth','1.2.2'
# Double-ugh
gem 'omniauth-meetup', '0.0.7'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-google-oauth2',"0.2.8"
gem 'omniauth-oauth2' ,"1.3.0"
# gem 'omniauth-meetup', '~> 0.0.2'
# gem 'omniauth-twitter'
# gem 'omniauth-facebook'
# gem 'omniauth-linkedin'
# gem 'omniauth-oauth2','~> 1.4.0'
# gem 'omniauth-google-oauth2',"~> 0.3.1"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'meetup_client'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'less-rails', "~> 2.7.1"
gem 'less-rails-bootstrap'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'yajl-ruby'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development
# Powering Faye messaging
gem 'private_pub'
# Heroku needs clarity sometimes
##############################################

# rails config
gem 'config'

# Styles
gem 'twitter-bootstrap-rails'
gem "font-awesome-rails", '~> 4.5.0'
# gem 'bootstrap-sass', '~> 3.3.5'
gem "select2-rails"
gem "devise-bootstrap-views"
gem "devise-i18n-views"
gem "simple_form"
gem "country_select"
gem 'currency_select', github: 'tanordheim/currency_select'
gem "cocoon"
gem "nested_form"
gem 'turbolinks'

# searches to try out
# sunspot solr search
gem 'sunspot_rails'
gem 'sunspot_solr'

# elastic search
gem 'elasticsearch',       git: 'git://github.com/elasticsearch/elasticsearch-ruby.git'
gem 'elasticsearch-persistence', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-model', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'

# elastic search
gem 'searchkick'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem 'therubyrhino',  platforms: :jruby

# Use Puma as the app server
gem 'puma'

#AUTHORIZATION
gem "cancancan"
gem "pundit",  github: "elabs/pundit"

# AUDITING
gem 'paper_trail', '>= 4.0.0'

# provide tagging capabilities
gem  'acts-as-taggable-on', '>= 3.5'

# DYMANIC HASHES
gem 'hashie'
gem 'rash',:github => "tcocca/rash"

# BACKGROUND PROCESSING
gem 'sinatra', require: nil
gem 'sidekiq'
# for checking the status of a specific job
gem 'sidekiq-status' # for checking the status of a specific job
gem "sidekiq-cron"
gem 'redis'

# for session store and cache store
gem 'redis-rails'
gem 'redis-namespace'
gem 'rubyzip' #we need this to play nice with sidekiq, otherwise it struggles to load zip

# ACTIVE RECORD Trees
gem 'closure_tree', '~> 5.2.0'

# for active record enumerations
gem  "enumerize"

# json & jsonb attributes
#gem "has_json_attributes_on", "~> 0.0.6", github: "wiseallie/has_json_attributes_on"

# Default values for models
gem "default_value_for", "~> 3.0.0"

# date and time validation plugin for ActiveModel and Rails
gem 'validates_timeliness', '~> 3.0'

# handle attributes only models
gem  'virtus'
gem  'inflecto'


# file uploads
gem 'net-ssh'
gem 'carrierwave', '~> 0.10.0'
gem "fog", "~> 1.31.0"
gem 'mini_magick', '~> 3.7.0'
gem "rmagick"

gem "literate_randomizer"
gem "faker"


# To use debugger
gem  'pry-rails'
gem  'pry-doc'
gem  'pry-git'
gem  'pry-stack_explorer'
gem  'pry-remote'
gem  "awesome_print"
gem  'byebug'

# GLOBAL VARIABLES IN EACH REQUEST
#git@github.com:steveklabnik/request_store.git
gem 'request_store'


#API JSON
gem 'inherited_resources'
gem 'responders'

#API CORS
gem 'rack-cors'

# active scaffold to make our lives easier
gem 'active_scaffold', "3.4.32"#, github: "activescaffold/active_scaffold"

# extract callbacks into observers
gem 'rails-observers'

# datatables for rails
gem 'kaminari'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git', branch: 'master'
gem 'ajax-datatables-rails', git: 'git://github.com/antillas21/ajax-datatables-rails.git', branch: 'master'


# admin for us
# gem 'rails_admin', '~> 0.8.1',  github: 'sferik/rails_admin'
#
# # file uploads
# gem 'rails_admin_jcrop' , git: 'git://github.com/janx/rails_admin_jcrop.git'

# trees
gem 'ancestry', github: "stefankroes/ancestry"
# gem 'rails_admin_nestable', git: 'git://github.com/dalpo/rails_admin_nestable.git'
# tags
# gem 'rails_admin_tag_list', :git => 'git://github.com/imouaddine/rails_admin_tag_list.git'
gem 'heroku'
gem 'activerecord-postgresql-citext'
gem 'pjax_rails'

gem 'bootstrap3-datetimepicker-rails', '~> 4.0.0'
gem 'momentjs-rails', '>= 2.9.0'

gem 'eventmachine', '~>1.0.4'
