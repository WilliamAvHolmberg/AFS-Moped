class Article
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :created_at, DateTime  # A DateTime, for any date you might like.

end
