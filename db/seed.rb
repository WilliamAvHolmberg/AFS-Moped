class Seeder
  def self.seed!
    self.article
  end

  def self.article
    Article.create(:name => "Lifan", :created_at => Time.now)
  end
end
