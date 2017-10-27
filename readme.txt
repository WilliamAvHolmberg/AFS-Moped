suppliersgit init
git add . || git add filename1
git commit -m 'pure rack app' || git commit -a - m "message"
git push heroku master


#skeleton for new supplier

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



rerun --ignore "*.{slim,js,css,coffee}" "rackup --host 0.0.0.0"
