class PartArticle
  include DataMapper::Resource

  property :id,           Serial
  property :amount,       Integer
  property :image_number, Integer
  belongs_to :part
  belongs_to :article


  def get_list_figure
    if !article.nil?
    return amount * article.list_price
  else
    return 0
  end
  end

  def get_net_figure
    if !article.nil?
    return amount * article.net_price
  else
    return 0
  end
  end
end
