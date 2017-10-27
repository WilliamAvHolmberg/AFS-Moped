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



  get '/constructions/:id/parts/:part' do |id,part|
    @construction = Construction.get(id)
    if part == "all"
      @main_parts = @construction.main_parts
      @title = @construction.name
    else
      @main_part = Part.get(part.to_i)
      @main_parts = @main_part.child_parts
      @title = @main_part.name
    end
    slim :"constructions/show"
  end

  post '/constructions/new' do
    construction = Construction.create(params[:construction])
    puts params[:construction]
    redirect to "/constructions/#{construction.id}"
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

  get '/constructions/:id/parts/:part' do |id, part|
    @construction = Construction.get(id)
    slim :"constructions/edit"
  end


  get '/parts' do
    @parts = Part.all
    slim :"parts/list"
  end

  get '/parts/new' do
    @constructions = Construction.all
    @parts = Part.all
    @part = Part.new
    slim :"parts/new"
  end

  get '/parts/:id' do |id|
    @part = Part.get(id)
    slim :"parts/show"
  end

  post '/parts/new' do
    puts params[:part]
    part = Part.create(params[:part])

    parent_id = params[:parent_id].to_i
    puts parent_id
    if !parent_id.nil? && parent_id > 0
      parent = Part.get(parent_id)
      part.add_parent(parent)
    end
    redirect to "/constructions/#{part.construction.id}"
  end

  get '/parts/:id/edit' do |id|
    @constructions = Construction.all
    @parts = Part.all
    @part = Part.get(id)
    slim :"parts/edit"
  end

  post '/parts/:id/update' do |id|
    part = Part.get(params[:id])
    part.update(params[:part])
    parent_id = params[:parent_id].to_i
    if !parent_id.nil? && parent_id > 0
      parent = Part.get(parent_id)
      part.add_parent(parent)
    end
    redirect to "/parts/#{part.id}"
  end

  post '/parts/:id/delete' do |id|
    puts id
    part = Part.get(id)
    part.remove
    redirect to '/parts'
  end

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
