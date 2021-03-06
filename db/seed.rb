class Seeder
  def self.seed!
    self.category
    self.article
    self.construction
    self.flakmoped

  end

  def self.category
    Category.create(:name => "Okategoriserat")
  end


  def self.article
    ##brickor
    Article.create(:name => "Bricka för M5 A4 Syrafast", :article_number => "3010500010", :net_price => 0.09, :list_price => 0.4, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Bricka för M6 A4 Syrafast", :article_number => "3010600010", :net_price => 0.16, :list_price => 0.5, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Bricka för M8 A4 Syrafast", :article_number => "3010800010", :net_price => 0.28, :list_price => 0.9, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Bricka för M10 A4 Syrafast", :article_number => "3011000010", :net_price => 0.52, :list_price => 1.3, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Bricka för M12 A4 Syrafast", :article_number => "3011200010", :net_price => 0.96, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "Fjäder-Bricka för M5 A4 Syrafast", :article_number => "3030500010", :net_price => 0.08, :list_price => 0.3, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Fjäder-Bricka för M6 A4 Syrafast", :article_number => "3030600010", :net_price => 0.14, :list_price => 0.5, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Fjäder-Bricka för M8 A4 Syrafast", :article_number => "3030800010", :net_price => 0.38, :list_price => 1, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Fjäder-Bricka för M10 A4 Syrafast", :article_number => "3031000010", :net_price => 0.40, :list_price => 1, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Fjäder-Bricka för M12 A4 Syrafast", :article_number => "3031200010", :net_price => 0.60, :list_price => 1.2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    ##mutter
    Article.create(:name => "Låsmutter för M5 A4 Syrafast", :article_number => "2020500010", :net_price => 0.28, :list_price => 1, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Låsmutter för M6 A4 Syrafast", :article_number => "2020600010", :net_price => 0.40, :list_price => 1.2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Låsmutter för M8 A4 Syrafast", :article_number => "2020800010", :net_price => 0.90, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Låsmutter för M10 A4 Syrafast", :article_number => "2021000010", :net_price => 1.92, :list_price => 4, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "Låsmutter för M12 A4 Syrafast", :article_number => "2021200010", :net_price => 2.88, :list_price => 6, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )


    #skruv
    Article.create(:name => "6-kantskruv M5x10 A4 Syrafast", :article_number => "1010501010", :net_price => 0.58, :list_price => 1.2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M5x12 A4 Syrafast", :article_number => "1010501210", :net_price => 0.60, :list_price => 1.3, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M5x16 A4 Syrafast", :article_number => "1010501610", :net_price => 0.72, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M5x30 A4 Syrafast", :article_number => "1010503010", :net_price => 1.09, :list_price => 3, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "6-kantskruv M6x14 A4 Syrafast", :article_number => "1010601410", :net_price => 0.92, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M6x20 A4 Syrafast", :article_number => "1010602010", :net_price => 0.96, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M6x30 A4 Syrafast", :article_number => "1010603010", :net_price => 1.24, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "6-kantskruv M8x22 A4 Syrafast", :article_number => "1010802210", :net_price => 2.35, :list_price => 4, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M8x35 A4 Syrafast", :article_number => "1010803510", :net_price => 2.56, :list_price => 4, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M8x40 A4 Syrafast", :article_number => "1010804010", :net_price => 2.80, :list_price => 5, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M8x50 A4 Syrafast", :article_number => "1010805010", :net_price => 3.32, :list_price => 6, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M8x60 A4 Syrafast", :article_number => "1010805510", :net_price => 3.56, :list_price => 6, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "6-kantskruv M10x14 A4 Syrafast", :article_number => "1011001410", :net_price => 6.37, :list_price => 10, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M10x22 A4 Syrafast", :article_number => "1011002210", :net_price => 4.34, :list_price => 10, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )
    Article.create(:name => "6-kantskruv M10x75 A4 Syrafast", :article_number => "1011007510", :net_price => 8.32, :list_price => 15, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "6-kantskruv M12x70 A4 Syrafast", :article_number => "1011207010", :net_price => 10.41, :list_price => 15, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "Insex M5x20 A4 Syrafast", :article_number => "1050502010", :net_price => 0.80, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )

    Article.create(:name => "Fästskruv RXS 16x5,5 A4 Syrafast", :article_number => "1314801610", :net_price => 0.60, :list_price => 2, :supplier => Supplier.first_or_create(:name => "FastPro"), :category => Category.first_or_create(:name => "Skruv och mutter") )


    #bakskärm/kedjeskydd
    Article.create(:name => "Bakskärm 1189", :article_number => "11-49-101", :net_price => 288, :list_price => 450, :supplier => Supplier.first_or_create(:name => "Norscand"))
    Article.create(:name => "Kedjeskydd 1189", :article_number => "11-48-101", :net_price => 182, :list_price => 285, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Skärmstag övre 1189", :article_number => "11-33-201", :net_price => 95, :list_price => 195, :supplier => Supplier.first_or_create(:name => "Norscand"))
    Article.create(:name => "Skärmstag undre 1189", :article_number => "11-41-401", :net_price => 95, :list_price => 195, :supplier => Supplier.first_or_create(:name => "Norscand"))


    #flak
    Article.create(:name => "Lastflaksbotten, aluminium",  :net_price => 700, :list_price => 1200, :supplier => Supplier.first_or_create(:name => "Montano"))
    Article.create(:name => "Lastflakssarg, inpregnerat trä, 1meter",  :net_price => 14, :list_price => 30, :supplier => Supplier.first_or_create("Brännö HB"))







    #okategoriserat
    Article.create(:name => "Gashandtag kompl. Svart med Spak", :article_number => "01-31-101A", :net_price => 130, :list_price => 245, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrstam 21mm", :article_number => "01-35-102", :net_price => 100, :list_price => 175, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styre MCB", :article_number => "06-55-101", :net_price => 150, :list_price => 265, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Sadel universal Svart", :article_number => "01-39-101", :net_price => 225, :list_price => 450, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Sadelstolpe universal 22mm", :article_number => "01-46-202", :net_price => 40, :list_price => 70, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsbackar MCB", :article_number => "01-42-501", :net_price => 110, :list_price => 195, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Tanklock MCB", :article_number => "01-47-403", :net_price => 29, :list_price => 50, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrlagersats kompl MCB", :article_number => "01-66-508", :net_price => 200, :list_price => 395, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bensinkran M16 Kvalite", :article_number => "02-24-401", :net_price => 90, :list_price => 145, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Baklampa kompl Universal", :article_number => "02-41-301", :net_price => 66, :list_price => 100, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Fotstegsgummi HVA 21mm", :article_number => "02-56-301", :net_price => 40, :list_price => 75, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromspedalgummi Lifan", :article_number => "01-17-404", :net_price => 25, :list_price => 40, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Slang 350/400-8", :article_number => "04-15-301", :net_price => 49, :list_price => 80, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Fotpinnsbrygga med bromspedal Lifan", :article_number => "05-25-401", :net_price => 195, :list_price => 395, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bakdrev 54T för Leleu-nav", :article_number => "05-31-203", :net_price => 129, :list_price => 250, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Gummibuffert Flakmoped", :article_number => "11-41-101", :net_price => 150, :list_price => 295, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Kåpa för gummibuffert", :article_number => "11-41-201", :net_price => 45, :list_price => 75, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Stoppgummi MCB", :article_number => "11-41-303", :net_price => 20, :list_price => 35, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsstång fram", :article_number => "11-42-201", :net_price => 130, :list_price => 245, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Silentblock för framaxel", :article_number => "11-42-301", :net_price => 90, :list_price => 160, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsexcenter sats höger", :article_number => "11-43-101", :net_price => 80, :list_price => 125, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsexcenter sats vänster", :article_number => "11-43-201", :net_price => 85, :list_price => 125, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsarm fram", :article_number => "11-43-301", :net_price => 89, :list_price => 165, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Stänkskydd transport", :article_number => "11-44-101", :net_price => 80, :list_price => 125, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Silentblock för stag", :article_number => "11-44-201", :net_price => 40, :list_price => 60, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrklamma kompl", :article_number => "11-44-301", :net_price => 33, :list_price => 50, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrlänkarm kompl", :article_number => "11-45-201", :net_price => 165, :list_price => 325, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsstag fram kompl", :article_number => "11-46-101", :net_price => 89, :list_price => 155, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bromsstag bak kompl", :article_number => "11-43-401", :net_price => 50, :list_price => 85, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrlänk trp", :article_number => "11-48-201", :net_price => 160, :list_price => 295, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrlagerrör inre Transportmoped", :article_number => "11-52-301", :net_price => 240, :list_price => 475, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Kopplingshandtag med choke", :article_number => "14-48-301", :net_price => 150, :list_price => 295, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Bakbromswire MCB", :article_number => "27-13-101", :net_price => 48, :list_price => 75, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Klamma för bensinslang", :article_number => "55-3068", :net_price => 4, :list_price => 5, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Växelpedal Lifan, Dubbel", :article_number => "61-31-401", :net_price => 40, :list_price => 80, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Monteringssats 1189, Motor Lifan", :article_number => "61-34-101", :net_price => 250, :list_price => 395, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Monteringssats 1187, Motor Lifan", :article_number => "61-34-701", :net_price => 350, :list_price => 495, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Däck 400-8 F-879", :article_number => "99-107-00", :net_price => 135, :list_price => 265, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Framhjul/Styrspindel Höger komplett inlk lager", :article_number => "K-1101", :net_price => 695, :list_price => 1295, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Framhjul/Styrspindel Vänster komplett inlk lager", :article_number => "K-1102", :net_price => 695, :list_price => 1295, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Framhjul", :article_number => "11-58-101", :net_price => 500, :list_price => 700, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrspindel Höger", :article_number => "11-56-101", :net_price => 330, :list_price => 500, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Styrspindel Vänster", :article_number => "11-57-101", :net_price => 330, :list_price => 500, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Kullager 6005", :article_number => "55-1434", :net_price => 45, :list_price => 80, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Navkapsel Framhjul", :article_number => "11-45-101", :net_price => 42, :list_price => 75, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Låsring Framhjul", :article_number => "55-1838", :net_price => 5, :list_price => 10, :supplier => Supplier.first_or_create(:name => "Norscand") )


    Article.create(:name => "Bensinslang Transparent", :article_number => "R-1002", :net_price => 12, :list_price => 20, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Tanklist Svart, Transportmoped ", :article_number => "R-1008", :net_price => 52, :list_price => 79, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Kedjesträckare MCB", :article_number => "01-54-301", :net_price => 13, :list_price => 20, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Framdrev Lifan 12T", :article_number => "02-12-201", :net_price => 29, :list_price => 45, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Framdrev Lifan 13T", :article_number => "02-12-301", :net_price => 29, :list_price => 45, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Signalhorn 12V DC", :article_number => "05-33-301", :net_price => 49, :list_price => 95, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Avgaskrök Lifan", :article_number => "10-58-101", :net_price => 98, :list_price => 195, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Hörnbeslagsats till lastflak", :article_number => "11-42-101", :net_price => 165, :list_price => 350, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Kopplingswire Lifan, Norscand", :article_number => "20-14-401", :net_price => 36, :list_price => 60, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Gaswire Lifan, Norscand", :article_number => "20-14-401", :net_price => 60, :list_price => 90, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Omkopplare universal 3-vägs", :article_number => "01-32-102", :net_price => 95, :list_price => 145, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Fälgband 14-15", :article_number => "04-44-102", :net_price => 13, :list_price => 20, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Komplett bakhjul Leleu", :article_number => "H-1005", :net_price => 1695, :list_price => 2995, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Däck 250-15 F-879", :article_number => "99-109-00", :net_price => 130, :list_price => 255, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Slang 225/250-15", :article_number => "04-33-101", :net_price => 47, :list_price => 70, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Kupolmutter M12x1", :article_number => "55-1637", :net_price => 15, :list_price => 25, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Parallellstag MCB 1189", :article_number => "11-47-101", :net_price => 179, :list_price => 375, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Pedal för parkeringsbroms", :article_number => "11-42-102", :net_price => 140, :list_price => 245, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Förgasare Lifan 49-72CC, Norscand", :article_number => "61-31-101", :net_price => 175, :list_price => 260, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Insugningsrör Lifan typ 1", :article_number => "61-31-301", :net_price => 40, :list_price => 60, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Insugningsrör Lifan typ 2", :article_number => "61-31-302", :net_price => 70, :list_price => 110, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Insugspackning Lifan", :article_number => "61-33-801", :net_price => 22, :list_price => 35, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Tändspole Lifan", :article_number => "61-31-601", :net_price => 64, :list_price => 100, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "CDI Lifan", :article_number => "05-31-301", :net_price => 120, :list_price => 190, :supplier => Supplier.first_or_create(:name => "Norscand") )
    Article.create(:name => "Voltregulator 12V", :article_number => "09-55-102", :net_price => 125, :list_price => 195, :supplier => Supplier.first_or_create(:name => "Norscand") )


    Article.create(:name => "Avgassystem special", :article_number => "F-007", :net_price => 430, :list_price => 630, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Luftfilter-kåpa", :article_number => "Filter-kåpa-32", :net_price => 73, :list_price => 125, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Motor Lifan 49cc, kickstart", :article_number => "M-001", :net_price => 1700, :list_price => 2500, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Multifunktion insugsplatta", :article_number => "041D", :net_price => 67, :list_price => 120, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Kedja 420 Lifan", :article_number => "kedja-420-120L", :net_price => 84, :list_price => 150, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Kopplingswire Lifan, BikeNet", :article_number => "F-028", :net_price => 50, :list_price => 90,:supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Bromshandtag, kopplingshandtag Lifan, BikeNet", :article_number => "F-016", :net_price => 50, :list_price => 80,:supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Framlyse 12 Volt, BikeNet", :article_number => "F-001", :net_price => 165, :list_price => 290,:supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Gasrulle med handtag", :article_number => "Gas+handtag", :net_price => 90, :list_price => 160,:supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Gasvajer, Lifan, BikeNet", :article_number => "047A", :net_price => 50, :list_price => 90,:supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Bakdrev-60T BikeNet", :article_number => "F-010", :net_price => 105, :list_price => 180,:supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Bakhjul komplett 60T", :article_number => "F-014", :net_price => 1081, :list_price => 1590, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Bromssköldsstag, BikeNet", :article_number => "F-017", :net_price => 190, :list_price => 280, :supplier => Supplier.first_or_create(:name => "BikeNet") )
    Article.create(:name => "Kopplingslåda", :article_number => "K-låda", :net_price => 400, :list_price => 600,:supplier => Supplier.first_or_create(:name => "BikeNet") )







  end

  def self.construction
  end

  def self.flakmoped
    flakmoped_skeleton = Construction.create(:name => "Flakmoped - 1")
    MopedSkeleton.create_moped(flakmoped_skeleton)
  end

end
