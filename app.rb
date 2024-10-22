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

get ("/payment/new") do 
  erb(:payment_calc)
end

get ("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f / 12
  @user_years = params.fetch("user_years").to_i * 12
  @user_pv = params.fetch("user_pv").to_f
  @the_result = (((@user_apr.round(4)) * @user_pv) / (1+(1-(@user_apr.round(4)/100.0)) ** -@user_years)).to_fs(:currency)
  @apr_out = @user_apr.to_fs(:percentage, {:precision => 4})
  @pv_out = @user_pv.to_fs(:currency)
  @years_out = params.fetch("user_years")
  erb(:payment_results)
end




get ("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
