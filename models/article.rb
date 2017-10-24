class Article
  include DataMapper::Resource

  property :id,                               Serial    # An auto-increment integer key
  property :article_number,                   String    # A unique 'number' to keep track of our articles
  property :suppliers_article_number,         String    # The article number that our supplier use for the specific article
  property :name,                             String    # Name of the Article
  property :created_at,                       DateTime  # A DateTime, for any date you might like.
  property :list_price,                       Integer   # The suggested "retail" price that will be shown to our customers
  property :net_price,                        Integer   # The final charge we payed for the article
  property :description,                      Text      # Description of the article
  ## TOdo
  # => Supplier
  # => Category
  # => Part
end
