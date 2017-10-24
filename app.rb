class App < Sinatra::Base

  get '/' do
    "Helloooo"
  end

  get '/articles' do
    @articles = Article.all
    slim :articles
  end

  get '/articles/new' do
    @article = Article.new
    slim :new_article
  end

  get '/articles/:id' do |id|
    @article = Article.get(id)
    slim :show_article
  end

  post '/articles/new' do
    article = Article.create(params[:article])
    redirect to "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do |id|
    @article = Article.get(id)
    slim :edit_article
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
end
