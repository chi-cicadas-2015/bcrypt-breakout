before '/users/*' do
  unless authenticated?
    redirect '/sessions/new'
  end
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end

get '/users/:id/edit' do
  if current_user.id.to_i != params[:id].to_i
    redirect "/users/#{params[:id]}"
  end

  @user = User.find(params[:id])
  erb :"users/edit"
end

put '/users/:id' do
  if current_user.id.to_i != params[:id].to_i
    redirect "/users/#{params[:id]}"
  end

  @user = User.find(params[:id])

  if @user.update_attributes(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :"users/edit"
  end
end