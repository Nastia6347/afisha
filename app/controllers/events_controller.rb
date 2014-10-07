class EventsController < ApplicationController
  def eventinfo
  require 'net/http'
@city = 3
BRANCHES.each do |branch|
	if branch[:branch_id]==session[:branch_id]
		@city = branch[:town_id]
	end
end	
url = URI.parse("http://api.4geo.ru/rest2/affiche/eventOther.json?event=" + params[:id].to_s + "&town_id=" + @city.to_s)		
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		json = JSON.parse(res.body.force_encoding('UTF-8'))
if(json["status"].to_i == 200)
	@result = json
else
	redirect_to "/events/index"
end
@types = DATA_PROVIDER.getEventTypes(session[:branch_id])
end
end

