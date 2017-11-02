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
    flakmoped_skeleton = Construction.create(:name => "Flakmoped - 1")
      flakmoped_komplett = Part.create(:name => "Komplett Flakmoped", :construction => flakmoped_skeleton)
        bakdel = Part.create(:name => "Bakdel", :construction => flakmoped_skeleton, :part => flakmoped_komplett)
          fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M8x22 A4 Syrafast"), :amount => 1, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M8 A4 Syrafast"), :amount => 1, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M8 A4 Syrafast"), :amount => 1, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M10x14 A4 Syrafast"), :amount => 4, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "Fjäder-Bricka för M10 A4 Syrafast"), :amount => 4, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M10x22 A4 Syrafast"), :amount => 2, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "Fjäder-Bricka för M10 A4 Syrafast"), :amount => 2, :part => bakdel)
          fäst_element = PartArticle.create(:article => Article.first(:name => "Fjäder-Bricka för M10 A4 Syrafast"), :amount => 2, :part => bakdel)
          monteringssats = Part.create(:name => "Monteringssats", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Monteringssats, Motor Lifan"), :part => monteringssats)
          bakskärm = Part.create(:name => "Bakskärm", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Bakskärm 1189"), :part => bakskärm)
            fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M5x12 A4 Syrafast"), :amount => 1, :part => bakskärm)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => 1, :part => bakskärm)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => 1, :part => bakskärm)
            fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M5x30 A4 Syrafast"), :amount => 1, :part => bakskärm)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => 1, :part => bakskärm)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => 1, :part => bakskärm)
            skärmstag_övre = Part.create(:name => "Skärmstag Övre", :construction => flakmoped_skeleton, :part => bakskärm)
              element = PartArticle.create(:article => Article.first(:name => "Skärmstag övre 1189"), :part => skärmstag_övre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M5x12 A4 Syrafast"), :amount => 2, :part => skärmstag_övre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => 2, :part => skärmstag_övre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => 2, :part => skärmstag_övre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M6x20 A4 Syrafast"), :amount => 2, :part => skärmstag_övre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M6 A4 Syrafast"), :amount => 2, :part => skärmstag_övre)
            skärmstag_undre = Part.create(:name => "Skärmstag Undre", :construction => flakmoped_skeleton, :part => bakskärm)
              element = PartArticle.create(:article => Article.first(:name => "Skärmstag undre 1189"), :part => skärmstag_undre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M6x14 A4 Syrafast"), :amount => 1, :part => skärmstag_undre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => 1, :part => skärmstag_undre)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M6 A4 Syrafast"), :amount => 1, :part => skärmstag_undre)
          baklyse = Part.create(:name => "Baklyse", :construction => flakmoped_skeleton, :part => bakskärm)
            element = PartArticle.create(:article => Article.first(:name => "Baklampa kompl Universal"), :part => baklyse)
          kedjeskydd = Part.create(:name => "Kedjeskydd", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Kedjeskydd 1189"), :part => kedjeskydd)
            fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M5x10 A4 Syrafast"), :amount => 2, :part => kedjeskydd)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => 2, :part => kedjeskydd)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => 1, :part => kedjeskydd)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M6 A4 Syrafast"), :amount => 1, :part => kedjeskydd)
          styre = Part.create(:name => "Styre", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Styre MCB"), :part => styre)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Styrstam 21mm"), :amount => 1, :part => styre)
            gashandtag = Part.create(:name => "Gashandtag", :construction => flakmoped_skeleton, :part => styre)
              element = PartArticle.create(:article => Article.first(:name => "Gashandtag kompl. Svart med Spak"), :part => gashandtag)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Gasvajer, Lifan, BikeNet"), :amount => 1, :part => gashandtag)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bakbromswire MCB"), :amount => 1, :part => gashandtag)
            kopplingshandtag = Part.create(:name => "kopplingshandtag", :construction => flakmoped_skeleton, :part => styre)
              element = PartArticle.create(:article => Article.first(:name => "Kopplingshandtag med choke"), :part => kopplingshandtag)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Kopplingswire Lifan, Norscand"), :amount => 1, :part => kopplingshandtag)
          bakhjul = Part.create(:name => "Bakhjul", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Komplett bakhjul Leleu"), :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Däck 250-15 F-879"), :amount => 1, :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Slang 225/250-15"), :amount => 1, :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Fälgband 14-15"), :amount => 1, :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Kedjesträckare MCB"), :amount => 2, :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M12 A4 Syrafast"), :amount => 2, :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Kupolmutter M12x1"), :amount => 2, :part => bakhjul)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Kedja 420 Lifan"), :amount => 1, :part => bakhjul)


          sadel = Part.create(:name => "Sadel", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Sadel universal Svart"), :part => sadel)
            element = PartArticle.create(:article => Article.first(:name => "Sadel universal Svart"), :part => sadel)
          motor = Part.create(:name => "Motor", :construction => flakmoped_skeleton, :part => bakdel)
            element = PartArticle.create(:article => Article.first(:name => "Motor Lifan 49cc, kickstart"), :part => motor)
            förgasare = Part.create(:name => "Förgasare", :construction => flakmoped_skeleton, :part => motor)
              element = PartArticle.create(:article => Article.first(:name => "Förgasare Lifan 49-72CC, Norscand"), :part => förgasare)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Multifunktion insugsplatta"), :amount => 1, :part => förgasare)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Insugninrsrör Lifan typ 1"), :amount => 1, :part => förgasare)
            fotbrygga = Part.create(:name => "Fotbrygga", :construction => flakmoped_skeleton, :part => motor)
              element = PartArticle.create(:article => Article.first(:name => "Fotpinnsbrygga med bromspedal Lifan"), :part => fotbrygga)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Fotstegsgummi HVA 21mm"), :amount => 1, :part => fotbrygga)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bromspedalgummi Lifan"), :amount => 1, :part => fotbrygga)
            avgassystem = Part.create(:name => "Avgassystem", :construction => flakmoped_skeleton, :part => motor)
              element = PartArticle.create(:article => Article.first(:name => "Avgassystem special"), :part => avgassystem)

          bensintank = Part.create(:name => "Bensintank", :construction => flakmoped_skeleton, :part => bakdel)
            #element = PartArticle.create(:article => Article.first(:name => "Tank"), :part => motor)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Tanklock MCB"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bensinkran M16 Kvalite"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bensinslang Transparent"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M8 A4 Syrafast"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M8x60 A4 Syrafast"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Fästskruv RXS 16x5,5 A4 Syrafast"), :amount => 1, :part => bensintank)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M8 A4 Syrafast"), :amount => 1, :part => bensintank)

        framdel = Part.create(:name => "Framdel", :construction => flakmoped_skeleton, :part => flakmoped_komplett)
          lastflak = Part.create(:name => "Lastflak", :construction => flakmoped_skeleton, :part => framdel)
            element = PartArticle.create(:article => Article.first(:name => "Lastflaksbotten, aluminium"), :part => lastflak)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Insex M5x20 A4 Syrafast"), :amount => "6", :part => lastflak)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Fjäder-Bricka för M5 A4 Syrafast"), :amount => "6", :part => lastflak)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => "6", :part => lastflak)
            sarg = Part.create(:name => "Sarg", :construction => flakmoped_skeleton, :part => lastflak)
              element = PartArticle.create(:article => Article.first(:name => "Lastflakssarg, inpregnerat trä, 1meter"), :amount => "4", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Hörnbeslagsats till lastflak"), :amount => "1", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M5x30 A4 Syrafast"), :amount => "16", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => "16", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => "16", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M6x14 A4 Syrafast"), :amount => "2", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M6 A4 Syrafast"), :amount => "2", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M6 A4 Syrafast"), :amount => "2", :part => sarg)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Fästskruv RXS 16x5,5 A4 Syrafast"), :amount => "12", :part => sarg)
            stänkskydd = Part.create(:name => "Stänkskydd", :construction => flakmoped_skeleton, :part => lastflak)
              element = PartArticle.create(:article => Article.first(:name => "Stänkskydd transport"), :amount => "2", :part => stänkskydd)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Insex M5x20 A4 Syrafast"), :amount => "4", :part => stänkskydd)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => "4", :part => stänkskydd)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => "4", :part => stänkskydd)
          framaxel = Part.create(:name => "Framaxel", :construction => flakmoped_skeleton, :part => framdel)
            silentblock = Part.create(:name => "Silentblock", :construction => flakmoped_skeleton, :part => framaxel)
              element = PartArticle.create(:article => Article.first(:name => "Silentblock för framaxel"), :amount => "2", :part => silentblock)
              fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M12x70 A4 Syrafast"), :amount => "2", :part => silentblock)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Fjäder-Bricka för M12 A4 Syrafast"), :amount => "2", :part => silentblock)
              fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M12 A4 Syrafast"), :amount => "2", :part => silentblock)
            hjulanordning = Part.create(:name => "Hjulanordning", :construction => flakmoped_skeleton,  :part => framaxel)
              framhjul_vänster= Part.create(:name => "Framhjul Vänster", :construction => flakmoped_skeleton,  :part => hjulanordning)
                styrspindel_vänster= Part.create(:name => "Styrspindel Vänster", :construction => flakmoped_skeleton,  :part => framhjul_vänster)
                  element = PartArticle.create(:article => Article.first(:name => "Styrspindel Vänster"), :amount => "1", :part => styrspindel_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Bromsbackar MCB"), :amount => "1", :part => styrspindel_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Låsring Framhjul"), :amount => "2", :part => styrspindel_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Styrlagersats kompl MCB"), :amount => "1", :part => styrspindel_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Bromsexcenter sats vänster"), :amount => "1", :part => styrspindel_vänster)
                fälg_vänster= Part.create(:name => "Fälg Vänster", :construction => flakmoped_skeleton,  :part => framhjul_vänster)
                  element = PartArticle.create(:article => Article.first(:name => "Framhjul"), :amount => "1", :part => fälg_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Kullager 6005"), :amount => "2", :part => fälg_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Navkapsel Framhjul"), :amount => "1", :part => fälg_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Däck 400-8 F-879"), :amount => "1", :part => fälg_vänster)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Slang 350/400-8"), :amount => "1", :part => fälg_vänster)
              framhjul_höger= Part.create(:name => "Framhjul Höger", :construction => flakmoped_skeleton,  :part => hjulanordning)
                styrspindel_höger= Part.create(:name => "Styrspindel Höger", :construction => flakmoped_skeleton,  :part => framhjul_höger)
                  element = PartArticle.create(:article => Article.first(:name => "Styrspindel Höger"), :amount => "1", :part => styrspindel_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Bromsbackar MCB"), :amount => "1", :part => styrspindel_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Låsring Framhjul"), :amount => "2", :part => styrspindel_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Styrlagersats kompl MCB"), :amount => "1", :part => styrspindel_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Bromsexcenter sats höger"), :amount => "1", :part => styrspindel_höger)
                fälg_höger= Part.create(:name => "Fälg höger", :construction => flakmoped_skeleton,  :part => framhjul_höger)
                  element = PartArticle.create(:article => Article.first(:name => "Framhjul"), :amount => "1", :part => fälg_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Kullager 6005"), :amount => "2", :part => fälg_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Navkapsel Framhjul"), :amount => "1", :part => fälg_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Däck 400-8 F-879"), :amount => "1", :part => fälg_höger)
                  fäst_element = PartArticle.create(:article => Article.first(:name => "Slang 350/400-8"), :amount => "1", :part => fälg_höger)
            styrinrättning = Part.create(:name => "Styrinrättning", :construction => flakmoped_skeleton,  :part => framaxel)
              styrlagerrör= Part.create(:name => "Styrlagerrör", :construction => flakmoped_skeleton,  :part => styrinrättning)
                element = PartArticle.create(:article => Article.first(:name => "Styrlagerrör inre Transportmoped"), :amount => "1", :part => styrlagerrör)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Styrlagersats kompl MCB"), :amount => "1", :part => styrlagerrör)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Styrklamma kompl"), :amount => "1", :part => styrlagerrör)
              parallellstag= Part.create(:name => "Parallellstag", :construction => flakmoped_skeleton,  :part => styrinrättning)
                element = PartArticle.create(:article => Article.first(:name => "Parallellstag MCB 1189"), :amount => "1", :part => parallellstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M8x40 A4 Syrafast"), :amount => "2", :part => parallellstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M8 A4 Syrafast"), :amount => "4", :part => parallellstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Silentblock för stag"), :amount => "2", :part => parallellstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M8 A4 Syrafast"), :amount => "2", :part => parallellstag)
              styrlänksstag= Part.create(:name => "Styrlänksstag", :construction => flakmoped_skeleton,  :part => styrinrättning)
                element = PartArticle.create(:article => Article.first(:name => "Styrlänk trp"), :amount => "1", :part => styrlänksstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Silentblock för stag"), :amount => "2", :part => styrlänksstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "6-kantskruv M8x40 A4 Syrafast"), :amount => "2", :part => styrlänksstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M8 A4 Syrafast"), :amount => "4", :part => styrlänksstag)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M8 A4 Syrafast"), :amount => "2", :part => styrlänksstag)

            bromsanordning = Part.create(:name => "Bromsanordning", :construction => flakmoped_skeleton,  :part => framaxel)
              bromsstänger= Part.create(:name => "Bromsstänger", :construction => flakmoped_skeleton,  :part => bromsanordning)
                element = PartArticle.create(:article => Article.first(:name => "Bromsstång fram"), :amount => "2", :part => bromsstänger)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Bromsarm fram"), :amount => "2", :part => bromsstänger)
              bromsstag_fram= Part.create(:name => "Bromsstag fram", :construction => flakmoped_skeleton,  :part => bromsanordning)
                element = PartArticle.create(:article => Article.first(:name => "Bromsstag fram kompl"), :amount => "1", :part => bromsstag_fram)
              bromsstag_bak= Part.create(:name => "Bromsstag bak", :construction => flakmoped_skeleton,  :part => bromsanordning)
                element = PartArticle.create(:article => Article.first(:name => "Pedal för parkeringsbroms"), :amount => "1", :part => bromsstag_bak)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Bromsstag bak kompl"), :amount => "1", :part => bromsstag_bak)
                fäst_element = PartArticle.create(:article => Article.first(:name => "Stoppgummi MCB"), :amount => "1", :part => bromsstag_bak)
          fjädring = Part.create(:name => "fjädring", :construction => flakmoped_skeleton, :part => framdel)
            element = PartArticle.create(:article => Article.first(:name => "Gummibuffert Flakmoped"), :amount => "2", :part => fjädring)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Kåpa för gummibuffert"), :amount => "2", :part => fjädring)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M10 A4 Syrafast"), :amount => "4", :part => fjädring)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Fjäder-Bricka för M10 A4 Syrafast"), :amount => "4", :part => fjädring)


        elektrisk_utrustning = Part.create(:name => "Elektrisk utrustning", :construction => flakmoped_skeleton, :part => flakmoped_komplett)
          kopplingslåda = Part.create(:name => "Kopplingslåda", :construction => flakmoped_skeleton, :part => elektrisk_utrustning)
            element = PartArticle.create(:article => Article.first(:name => "Kopplingslåda"), :amount => "1", :part => kopplingslåda)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Tändspole Lifan"), :amount => "1", :part => kopplingslåda)
            fäst_element = PartArticle.create(:article => Article.first(:name => "CDI Lifan"), :amount => "1", :part => kopplingslåda)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Voltregulator 12V"), :amount => "1", :part => kopplingslåda)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Insex M5x20 A4 Syrafast"), :amount => "4", :part => kopplingslåda)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Bricka för M5 A4 Syrafast"), :amount => "4", :part => kopplingslåda)
            fäst_element = PartArticle.create(:article => Article.first(:name => "Låsmutter för M5 A4 Syrafast"), :amount => "4", :part => kopplingslåda)
          framlyse = Part.create(:name => "Framlyse", :construction => flakmoped_skeleton, :part => elektrisk_utrustning)
            element = PartArticle.create(:article => Article.first(:name => "Framlyse 12 Volt, BikeNet"), :amount => "1", :part => framlyse)
          tuta = Part.create(:name => "Tuta", :construction => flakmoped_skeleton, :part => elektrisk_utrustning)
            element = PartArticle.create(:article => Article.first(:name => "Signalhorn 12V DC"), :amount => "1", :part => tuta)
  end



end
