class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_branch

  def set_branch
  	require 'net/http'

  	@branch = "+"

  	if session[:branch_id].nil?
	
		url = URI.parse("http://api.sypexgeo.net/json/95.190.249.10")		
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		json = JSON.parse(res.body.force_encoding('UTF-8'))
		
		city = json["city"]["name_ru"]
		
		BRANCHES.each do |branch|
			if Unicode.downcase(branch[:name])==Unicode.downcase(city)
				@branch = branch
			end
		end
	else
		BRANCHES.each do |branch|
			if branch[:branch_id]==session[:branch_id]
				@branch = branch
			end
		end		
  	end

  	session[:branch_id] = @branch[:branch_id]
@city = 3
BRANCHES.each do |branch|
	if branch[:branch_id]==session[:branch_id]
		@city = branch[:town_id]
	end
end	
@films = DATA_PROVIDER.getEventFilms(@city,Date.today.to_s,Date.today.to_s,"ASC")
@types = DATA_PROVIDER.getEventTypes(session[:branch_id])
end

def index
end

end



