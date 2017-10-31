class PartArticle
  include DataMapper::Resource

  property :id,           Serial
  property :amount,       Integer, :default => 1
  property :status,       Integer, :default => 0  #0 stands for "Not in stock", 1 stands for ordered but not recieved, 2 stands for "in stock" 3 stands for "dedicated to a specific construction"
  property :image_number, Integer
  property :list_figure,  Float, :default => -10
  belongs_to :part
  belongs_to :article


  def get_list_figure
    return get_article_list_figure * amount
  end

  def get_article_list_figure
    if status == 3
      return 0
    elsif !list_figure.nil? && list_figure != -10
      return list_figure
    end
    return article.list_price
  end

  def get_net_figure
    if !article.nil?
    return amount * article.net_price
  else
    return 0
  end
  end

  def get_status
    if status == 3
      return "Dedikerad"
    elsif status == 2
      return "I lager"
    elsif status == 1
      return "Beställd"
    end
      return "Behöver beställas"
  end




  def has_article
    if status == 2
      return true
    end
      return false
  end
end
