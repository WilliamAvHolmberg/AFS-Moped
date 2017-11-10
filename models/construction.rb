
class Construction
  include DataMapper::Resource

  property :id,                               Serial    # An auto-increment integer key  property :name,                             String    # Name of the Article
  property :name,                             String    # Name of the Construction
  property :created_at,                       DateTime  # A DateTime, for any date you might like.
  property :img_src,                          Text
  # => A construction is a product consisting of parts that are held together with articles
  # => Description of the construction
  # => total cost...
  # => Parts
  # => Articles

  has n, :parts

  def link(part)
    ConstructionPart.create(:construction => self, :part => part)
  end

  def main_parts
    return Part.all(:construction => self, :part_id => nil)
  end

  def get_total_cost
    cost = 0
    main_parts.each do |part|
      cost+=part.get_list_figure
    end
    puts cost
    return cost
  end

  def get_total_net_figure
    cost = 0
    main_parts.each do |part|
      cost+=part.get_net_figure
    end
    puts cost
    return cost
  end

  def get_all_required_part_articles
    list = []
    main_parts.each do |part|
      part.get_all_required_part_articles.each do |pa|
        list.push(pa)
      end
    end
    return list
  end





  def get_all_parts
    @all_parts = []
    parts.each do |part|
      @all_parts.push(part)
      loop_through(part)
    end
    return @all_parts
  end


  def get_all_part_articles
    @all_part_articles = []


    main_parts.each do |part|
      part.get_all_part_articles.each do |pa|
        @all_part_articles.push(pa)
      end
    end
    price = 0
    @all_part_articles.each do |pa|
      price += pa.get_list_figure
    end
    puts price
    return @all_part_articles
  end

  def get_all_part_articles_except_category(category)
    @all_part_articles = []


    main_parts.each do |part|
      part.get_all_part_articles.each do |pa|
        if pa.article.category.name != category
        @all_part_articles.push(pa)
        end
      end
    end
    price = 0
    @all_part_articles.each do |pa|
      price += pa.get_list_figure
    end
    puts price
    return @all_part_articles
  end

  def get_all_part_articles_except_category_and_only_specific_status(category, status)
    all_part_articles = []

    prices = 0
    main_parts.each do |part|
      part.get_all_part_articles.each do |pa|
        if pa.article.category.name != category && pa.status == status
        all_part_articles.push(pa)
        puts "#{pa.article.name} #{pa.get_list_figure}"

        prices += pa.get_list_figure
        end
      end
    end
    return all_part_articles
  end






  def loop_through(part)
    if
      part.parts.length > 0
      part.parts.each do |child_part|
      self.loop_through(child_part)
      @all_parts.push(child_part)
      end
    else
    end
  end

  def get_all_articles
    @articles = []
    main_parts.each do |part|
      part.get_all_articles.each do |article|
        puts "asd:#{article.name}"
        @articles.push(article)
      end
    end
    return @articles
  end



  def remove
    ConstructionPart.all(:construction => self).destroy
    Part.all(:construction => self).destroy
    self.destroy
    reload
    self
  end


  def create_flakmoped_skeleton
    MopedSkeleton.create_moped(self)
  end



end
