class FilmsController < ApplicationController
def filminfo
require 'net/http'
json = DATA_PROVIDER.getFilmInfo(params[:id],@city)
if(json["status"].to_i == 200)
	@result = json
else
	redirect_to "/films/index"
end
end
end
