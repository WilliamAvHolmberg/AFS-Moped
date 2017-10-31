class Part

  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, :required => true
  property :img_src,  Text



  belongs_to :construction
  belongs_to :part, required: false
  has n, :parts, 'Part'
  has n, :part_articles
  has n, :articles, :through => :part_articles



  def get_list_figure
    @price = 0
    part_articles.each do |pa|
      @price += pa.get_list_figure
    end

    parts.each do |part|
      @price += part.get_list_figure
    end
    return @price
  end

  def get_net_figure
    @price = 0
    part_articles.each do |pa|
      @price += pa.get_net_figure
    end

    parts.each do |part|
      @price += part.get_net_figure
    end
    return @price
  end

  def get_part_articles
    @part_articles = []
    part_articles.each do |pa|
      @part_articles.push(pa)
    end

    parts.each do |part|
      @part_articles.push(part.get_part_articles)
    end
    puts @part_articles.length
    return @part_articles
  end



  def get_all_articles
    @articles = []
    part_articles.each do |pa|
      pa.amount.times do
        @articles.push(pa.article)
      end
    end

    parts.each do |part|
      part.get_all_articles.each do |article|
      @articles.push(article)
    end
    end
    return @articles
  end

  def get_all_fastener_articles
    elements = []
    price = 0
    get_all_articles.each do |article|
      if article.category.name == "Skruv och mutter"
        elements.push(article)
      end
    end
    return elements
  end
end
