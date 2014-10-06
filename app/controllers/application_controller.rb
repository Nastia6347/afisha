class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_branch

  def set_branch
  	require 'net/http'

  	@branch = "+"

  	if session[:branch_id].nil?
		# url = URI.parse("http://api.sypexgeo.net/json/#{request.remote_ip}")
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


  end

def index
@city = 3
BRANCHES.each do |branch|
	if branch[:branch_id]==session[:branch_id]
		@city = branch[:town_id]
	end
end	
url= URI.parse("http://api.4geo.ru/rest2/affiche/events.json?content_type=-1001&town_id=" + @city.to_s + "&dateStart=" +  Date.today.to_s + "&dateEnd=" + Date.today.to_s + "&sorting=ASC")
req = Net::HTTP::Get.new(url.to_s)
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.request(req)
	}
	@json = JSON.parse(res.body.force_encoding('UTF-8'))
#@json = JSON.parse('{"count" : 4, "event":[{"name": "name1"}, {"name": "name2"}]}')

end

end



