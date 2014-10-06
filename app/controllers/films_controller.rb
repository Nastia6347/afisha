class FilmsController < ApplicationController
def filminfo
require 'net/http'
@cityid = 3
BRANCHES.each do |branch|
	if branch[:branch_id]==session[:branch_id]
		@cityid = branch[:town_id]
	end
end	
url = URI.parse("http://api.4geo.ru/rest2/affiche/eventMovie.json?event=" + params[:id].to_s + "&town_id=" + @cityid.to_s + "&date=" + Date.today.to_s)		
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		json = JSON.parse(res.body.force_encoding('UTF-8'))
if(json["status"].to_i == 200)
@jsn = res.body.force_encoding('UTF-8')
	@result = json
else
	redirect_to "/main/index"
end
end
end
