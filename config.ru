run lambda { |env| [200, {'Content-Type'=>'text/plain'}, StringIO.new("Hello Worlds!\n")] }
