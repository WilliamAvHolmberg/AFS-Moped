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
    return parts.select { |hash| hash.parent_parts.length == 0 }
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


  def remove
    ConstructionPart.all(:construction => self).destroy
    Part.all(:construction => self).destroy
    self.destroy
    reload
    self
  end



end
