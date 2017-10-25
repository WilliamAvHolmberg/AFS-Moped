categoriesgit init
git add . || git add filename1
git commit -m 'pure rack app' || git commit -a - m "message"
git push heroku master


#skeleton for new category

get '/categories' do
  @categories = category.all
  slim :"categories/list"
end

get '/categories/new' do
  @category = category.new
  slim :"categories/new"
end

get '/categories/:id' do |id|
  @category = category.get(id)
  slim :"categories/show"
end

post '/categories/new' do
  category = category.create(params[:category])
  redirect to "/categories/#{category.id}"
end

get '/categories/:id/edit' do |id|
  @category = category.get(id)
  slim :"categories/edit"
end

post '/categories:id/update' do |id|
  category = category.get(params[:id])
  category.update(params[:category])
  redirect to "/categories/#{category.id}"
end

post '/categories/:id/delete' do |id|
  category.get(id).destroy
  redirect to '/categories'
end


rerun --ignore "*.{slim,js,css,coffee}" "rackup --host 0.0.0.0"
