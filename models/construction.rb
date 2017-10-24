class Construction
  include DataMapper::Resource

  property :id,                               Serial    # An auto-increment integer key  property :name,                             String    # Name of the Article
  property :created_at,                       DateTime  # A DateTime, for any date you might like.
  # => A construction is a product consisting of parts that are held together with articles
  # => Description of the construction
  # => total cost...
  # => Parts
  # => Articles
end
