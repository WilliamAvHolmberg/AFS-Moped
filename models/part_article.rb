class PartArticle
  include DataMapper::Resource

  property :id,           Serial
  property :amount,       Integer
  property :image_number, Integer
  belongs_to :part
  belongs_to :article


  def get_list_figure
    return amount * article.list_price
  end

  def get_net_figure
    return amount * article.net_price
  end
end
