require "sinatra"
require "sinatra/reloader"

get ("/hello") do
  erb(:hello)
end

get ("/goodbye") do
  erb (:bye)
end

get ("/square/new") do 
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get ("/square_root/new") do 
  erb(:new_square_root_calc)
end

get ("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get ("/random/new") do 
  erb(:random_calc)
end

get ("/random/results") do
  @user_min = params.fetch("user_min").to_f
  @user_max = params.fetch("user_max").to_f
  @the_result = rand(@user_min..@user_max)
  erb(:random_results)
end




get ("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
