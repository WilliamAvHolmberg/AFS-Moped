class Construction
  include DataMapper::Resource

  property :id,                               Serial    # An auto-increment integer key  property :name,                             String    # Name of the Article
  property :name,                             String    # Name of the Construction
  property :created_at,                       DateTime  # A DateTime, for any date you might like.
  # => A construction is a product consisting of parts that are held together with articles
  # => Description of the construction
  # => total cost...
  # => Parts
  # => Articles
  has n, :construction_parts
  has n, :parts, :through => :construction_parts


  def link(part)
    ConstructionPart.create(:construction => self, :part => part)
  end

  def main_parts
    return self.parts
  end

  def get_all_parts
    @all_parts = []
    parts.each do |part|
      @all_parts.push(part)
      loop_through(part)
    end
    return @all_parts
  end

  def loop_through(part)
    if part.child_parts.length > 0
      part.child_parts.each do |child_part|
      self.loop_through(child_part)
      @all_parts.push(child_part)
      end
    else
    end
  end



end
