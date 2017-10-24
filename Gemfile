# Tell bundler where to fetch gems
source 'http://rubygems.org'

# Gems used by all environments (development, production & test)
gem 'sinatra'
gem 'data_mapper'
gem 'slim'
gem 'json', github: 'flori/json', branch: 'v1.8'
gem 'rake'

# Used during local development (on your own machine)
group :development do

  # Use SQLite
  gem 'dm-sqlite-adapter', group: :development
  gem 'rerun'

end

# Used during production (on Heroku), when your application is 'live'
group :production do

  # Use Postgresql
  gem 'dm-postgres-adapter', group: :production

end
