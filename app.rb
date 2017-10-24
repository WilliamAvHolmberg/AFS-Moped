class App < Sinatra::Base

  get '/' do
    "Helloooo"
  end

  get '/articles' do
    @articles = Article.all
    slim :"articles/list"
  end

  get '/articles/new' do
    @article = Article.new
    slim :"articles/new"
  end

  get '/articles/:id' do |id|
    @article = Article.get(id)
    slim :"articles/show"
  end

  post '/articles/new' do
    article = Article.create(params[:article])
    redirect to "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do |id|
    @article = Article.get(id)
    slim :"articles/edit"
  end

  post '/articles:id/update' do |id|
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
    @construction = Construction.get(id)
    slim :"constructions/show"
  end

  post '/constructions/new' do
    construction = Construction.create(params[:construction])
    redirect to "/constructions/#{construction.id}"
  end

  get '/constructions/:id/edit' do |id|
    @construction = Construction.get(id)
    slim :"constructions/edit"
  end

  post '/constructions:id/update' do |id|
    construction = Construction.get(params[:id])
    construction.update(params[:construction])
    redirect to "/constructions/#{construction.id}"
  end

  post '/constructions/:id/delete' do |id|
    Construction.get(id).destroy
    redirect to '/constructions'
  end

  get '/parts' do
    @parts = Part.all
    slim :"parts/list"
  end

  get '/parts/new' do
    @parts = Part.all
    @part = Part.new
    slim :"parts/new"
  end

  get '/parts/:id' do |id|
    @part = Part.get(id)
    @constructions = @part.constructions
    slim :"parts/show"
  end

  post '/parts/new' do
    part = Part.create(params[:part])
    redirect to "/parts/#{part.id}"
  end

  get '/parts/:id/edit' do |id|
    @parts = Part.all
    @part = Part.get(id)
    slim :"parts/edit"
  end

  post '/parts:id/update' do |id|
    part = Part.get(params[:id])
    part.update(params[:part])
    redirect to "/parts/#{part.id}"
  end

  post '/parts/:id/delete' do |id|
    Part.get(id).destroy
    redirect to '/parts'
  end



end
