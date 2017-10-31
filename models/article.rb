class Article
  include DataMapper::Resource

  property :id,              Serial    # An auto-increment integer key
  property :article_number,  String    # A unique 'number' to keep track of our articles
  property :name,            String    # Name of the Article
  property :created_at,      DateTime  # A DateTime, for any date you might like.
  property :list_price,      Float # The suggested "retail" price that will be shown to our customers
  property :net_price,       Float # The final charge we payed for the article (exluding vat)
  property :description,     Text      # Description of the article
  property :img_src,         Text
  ## TOdo
  # => Supplier
  # => Category
  # => Part

  belongs_to :category
  belongs_to :supplier
  has n, :part_articles

  def initialize(attributes={},&block)
    super(attributes,&block)
    # if no category is specified, set category to "övrigt"
    if category.nil?
      self.attributes = {:category_id => 1}
    end
  end

  def article_number
    return "#{category_id}-#{id}"
  end


end
