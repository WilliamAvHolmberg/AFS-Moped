class Seeder
  def self.seed!
    self.article
    self.part
    self.construction
  end

  def self.article
    Article.create(:name => "Lifan", :created_at => Time.now)
  end

  def self.part
    framdel = Part.create(:name => "Framdel")
    framdel1 = Part.create(:name => "Övre Framdel")
    framdel2 = Part.create(:name => "Undre Framdel")
    framdel1.link(framdel)
    framdel2.link(framdel)

    bakdel = Part.create(:name => "Bakdel")
    sadel= Part.create(:name => "Sadel")
    bakhjul = Part.create(:name => "Bakhjul")
    sadel.link(bakdel)
    bakhjul.link(bakdel)




  end

  def self.construction
    flakmoped = Construction.create(:name => "Flakmoped")
    flakmoped.link(Part.first(:name => "Framdel"))
    flakmoped.link(Part.first(:name => "Badel"))
  end

end
