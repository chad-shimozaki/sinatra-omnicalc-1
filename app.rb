require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do  
  erb(:square)
end

get("/square/results") do
  @number = params.fetch("user_number")
  @result = @number.to_f ** 2

  erb(:square_results)
end

get("/square_root/new") do  
  erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("user_number")
  @result = @number.to_f ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do

  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  r = (@apr / 100 ) / 12
  @apr_result = params.fetch("user_apr").to_f.to_fs(:percentage, {:precision => 4})

  @years = params.fetch("user_years").to_i
  n = @years * 12

  @principal = params.fetch("user_pv").to_f
  @principal_result = params.fetch("user_pv").to_f.to_fs(:currency)

  @result = ((r * @principal) / (1 - ((1 + r) ** (-n)))).to_fs(:currency)
  
  erb(:payment_results)
end

get("/random/new") do

  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @result = rand(@min..@max)

  erb(:random_results)
end
