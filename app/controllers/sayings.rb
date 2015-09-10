before '/sayings/*' do
  redirect '/sessions/new' unless authenticated?
end