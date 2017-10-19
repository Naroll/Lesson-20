require 'sinatra'

get '/' do 
	erb :index
end

get '/admin' do 
	erb :admin
end

post '/' do
	@user_name = params[:user_name]
	@phone = params[:phone]
	@date_time = params[:date_time]

	@title = 'Thank you!'
	@message = "Dear #{@user_name}, we'll bee waiting for you at #{@date_time}"

	f = File.open './public/users.txt', 'a'
	#chmod 666 users.txt
	f.write "User: #{@user_name}, phone: #{@phone}, date and time #{@date_time}"
	f.close

	erb :message
end

post '/admin' do
	@login = params[:login]
	@password = params[:password]
	if @login == 'admin' && @password == 'secret' then
		#Show users.txt
		@users_txt = File.open("users.txt","r")
	end
end