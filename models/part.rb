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

  def get_all_part_articles
    @pas = []
    part_articles.each do |pa|
      @pas.push(pa)
    end

    parts.each do |part|
      part.part_articles.each do |pa|
        @pas.push(pa)
      end
    end
    return @pas
  end


  def get_articles
    @articles = []
    part_articles.each do |pa|
      pa.amount.times do
        puts pa.article.name
        @articles.push(pa.article)
      end
    end

    parts.each do |part|
      part.get_articles.each do |article|
      @articles.push(article)
    end
    end
    @articles.each do |article|
      puts article.name
    end
    return @articles
  end
end
