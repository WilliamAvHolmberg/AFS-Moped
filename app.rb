class App < Sinatra::Base

  get '/' do
    slim :index
  end

  get '/articles' do
    @categories = Category.all
    @articles = Article.all
    slim :"articles/list"
  end

  get '/articles/new' do
    @categories = Category.all
    @suppliers = Supplier.all
    @article = Article.new
    slim :"articles/new"
  end

  get '/articles/:id' do |id|
    @article = Article.get(id)
    slim :"articles/show"
  end

  post '/articles/new' do
    article = Article.create(params[:article])
    puts params[:article]
    redirect to "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do |id|
    @categories = Category.all
    @suppliers = Supplier.all
    @article = Article.get(id)
    slim :"articles/edit"
  end

  post '/articles/:id/update' do |id|
    article = Article.get(params[:id])
    article.update(params[:article])
    redirect to "/articles/#{article.id}"
  end

  post '/articles/:id/delete' do |id|
    Article.get(id).destroy
    redirect to '/articles'
  end



  ###Constructions

  get '/constructions' do
    @constructions = Construction.all
    slim :"constructions/list"
  end

  get '/constructions/new' do
    @construction = Construction.new
    slim :"constructions/new"
  end

  get '/constructions/:id' do |id|
    redirect "/constructions/#{id}/parts/all"
  end

  post '/constructions/new' do
    construction = Construction.create(params[:construction])
    puts params[:construction]
    redirect to "/constructions/#{construction.id}"
  end

  post '/constructions/:id/delete' do |id|
    Construction.get(id).remove
    redirect to '/constructions'
  end

  get '/constructions/:id/edit' do |id|
    @construction = Construction.get(id)
    slim :"constructions/edit"
  end

  post '/constructions/:id/update' do |id|
    construction = Construction.get(params[:id])
    construction.update(params[:construction])
    redirect to "/constructions/#{construction.id}"
  end

  post '/constructions/:id/delete' do |id|
    Construction.get(id).remove
    redirect to '/constructions'
  end

  get '/construction/:id/parts/new' do |id|
    @construction = Construction.get(id)
    @parts = Part.all
    @part = Part.new
    slim :"parts/new"
  end

  post '/constructions/:id/parts/new' do |id|
    puts params[:part]
    part = Part.create(params[:part])
    redirect to "/constructions/#{part.construction.id}"
  end

  get '/constructions/:id/parts/all' do |id|
    @construction = Construction.get(id)
    @main_part = @construction
    @main_parts = @construction.main_parts
    @title = @construction.name
    slim :"constructions/show"
  end

  get '/pdf/constructions/:id/parts/all' do |id|
    @construction = Construction.get(id)
    @main_part = @construction
    @main_parts = @construction.main_parts
    @title = @construction.name
    slim :"constructions/pdf/list"
  end


  post '/constructions/:id/parts/delete' do
    if !params[:part_id].nil?
     params[:part_id].each do |part_id|
       part = Part.get(part_id)
       if !part.nil?
         PartArticle.all(:part => part).destroy
         part.parts.all.destroy
         part.destroy
       end
     end
   end
   redirect back
  end

  get '/constructions/:id/parts/:part' do |id, part|
    @articles = Article.all
    @construction = Construction.get(id)
    @main_part = Part.get(part)
    @main_parts = @main_part.parts
    @title = @construction.name
    if part == "all"
    slim :"constructions/show"
    else
    slim :"constructions/parts/show"
    end
  end

  get '/constructions/:id/parts/:part/edit' do |id, part|
    @construction = Construction.first(:id => id)
    @constructions = Construction.all
    @parts = Part.all
    @part = Part.get(part)
    @articles = Article.all
    slim :"constructions/parts/edit"
  end

  post '/constructions/:id/parts/:part/update' do |id,part|
    part = Part.get(params[:id])
    part.update(params[:part])
    redirect to "/parts/#{part.id}"
  end

  post '/constructions/:id/parts/:part/delete' do |id,part|
    puts id
    part = Part.get(id)
    PartArticle.all(:part => part).destroy
    part.parts.all.destroy
    part.destroy
    redirect to '/parts'
  end

  post '/constructions/:id/parts/:part_id/articles/new' do |id, part_id|
    PartArticle.create(:status => params[:status], :part_id => part_id, :article_id => params[:article_id], :amount => params[:amount])
    redirect back
  end

  post '/constructions/:id/parts/:part_id/articles/:part_article_id/update' do |id, part_id, part_article_id|
    part_article = PartArticle.first(:id => part_article_id)
    part_article.update(:status => params[:status], :amount => params[:amount], :list_figure => params[:list_figure])
    redirect back
  end

  post '/constructions/:id/parts/:part_id/articles/:part_article_id/delete' do |id, part_id, part_article_id|
    part_article = PartArticle.first(:id => part_article_id)
    part_article.destroy
    redirect back
  end


  ##################
  ####CATEGORIES####

  get '/categories' do
    @categories = Category.all
    slim :"categories/list"
  end

  get '/categories/new' do
    @category = Category.new
    slim :"categories/new"
  end

  get '/categories/:id' do |id|
    @category = Category.get(id)
    slim :"categories/show"
  end

  post '/categories/new' do
    category = Category.create(params[:category])
    redirect to "/categories/#{category.id}"
  end

  get '/categories/:id/edit' do |id|
    @category = Category.get(id)
    slim :"categories/edit"
  end

  post '/categories/:id/update' do |id|
    category = Category.get(params[:id])
    category.update(params[:category])
    redirect to "/categories/#{category.id}"
  end

  post '/categories/:id/delete' do |id|
    Category.get(id).destroy
    redirect to '/categories'
  end


  get '/suppliers' do
    @suppliers = Supplier.all
    slim :"suppliers/list"
  end

  get '/suppliers/new' do
    @supplier = Supplier.new
    slim :"suppliers/new"
  end

  get '/suppliers/:id' do |id|
    @supplier = Supplier.get(id)
    slim :"suppliers/show"
  end

  post '/suppliers/new' do
    supplier = Supplier.create(params[:supplier])
    redirect to "/suppliers/#{supplier.id}"
  end

  get '/suppliers/:id/edit' do |id|
    @supplier = Supplier.get(id)
    slim :"suppliers/edit"
  end

  post '/suppliers/:id/update' do |id|
    supplier = Supplier.get(params[:id])
    supplier.update(params[:supplier])
    redirect to "/suppliers/#{supplier.id}"
  end

  post '/suppliers/:id/delete' do |id|
    Supplier.get(id).destroy
    redirect to '/suppliers'
  end


end
