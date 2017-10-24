partsgit init
git add . || git add filename1
git commit -m 'pure rack app' || git commit -a - m "message"
git push heroku master


#skeleton for new part

get '/parts' do
  @parts = part.all
  slim :"parts/list"
end

get '/parts/new' do
  @part = part.new
  slim :"parts/new"
end

get '/parts/:id' do |id|
  @part = part.get(id)
  slim :"parts/show"
end

post '/parts/new' do
  part = part.create(params[:part])
  redirect to "/parts/#{part.id}"
end

get '/parts/:id/edit' do |id|
  @part = part.get(id)
  slim :"parts/edit"
end

post '/parts:id/update' do |id|
  part = part.get(params[:id])
  part.update(params[:part])
  redirect to "/parts/#{part.id}"
end

post '/parts/:id/delete' do |id|
  part.get(id).destroy
  redirect to '/parts'
end


rerun --ignore "*.{slim,js,css,coffee}" "rackup --host 0.0.0.0"
