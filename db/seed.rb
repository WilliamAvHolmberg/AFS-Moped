class Seeder
  def self.seed!
    self.category
    self.article
    self.part
    self.construction
  end

  def self.category
    Category.create(:name => "Övrigt")
  end

  def self.article
  end

  def self.part

  end

  def self.construction

  end

end
