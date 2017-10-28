class Seeder
  def self.seed!
    self.category
    self.article
    self.construction
    self.part
  end

  def self.category
    Category.create(:name => "Övrigt")
  end

  def self.article
  end

  def self.construction
  end

  def self.part
  end

end
