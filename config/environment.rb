#Load all models
Dir["./models/*.rb"].each {|model| require model}

# Used during local development (on your own machine)
configure :development do

  puts "*******************"
  puts "* DEVELOPMENT ENV *"
  puts "*******************"

  # Enable logging to console
  #DataMapper::Logger.new($stdout, :debug)
  # Use SQLite
  #DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/app-dev.sqlite")

  #always use postgres db (unless no connection)
  DataMapper.setup(:default, 'postgres://qqpsofimledkok:aedbc74836fdc73f91e8cb6c1428ab94eec89ca97b2dce6853c5451c32848934@ec2-54-243-47-252.compute-1.amazonaws.com:5432/d8vsoa0f7ujj34')

  # Enable pretty printing of Slim-generated HTML (for debugging)
  Slim::Engine.set_options pretty: true, sort_attrs: false


end


# Used during production (on Heroku), when your application is 'live'
configure :production do

  puts "******************"
  puts "* PRODUCTION ENV *"
  puts "******************"

  # Use Postgresql
  DataMapper.setup(:default, 'postgres://qqpsofimledkok:aedbc74836fdc73f91e8cb6c1428ab94eec89ca97b2dce6853c5451c32848934@ec2-54-243-47-252.compute-1.amazonaws.com:5432/d8vsoa0f7ujj34')

end

# Load the application
require_relative '../app'

# Check that all models and associations are ok
DataMapper.finalize
