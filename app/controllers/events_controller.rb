class EventsController < ApplicationController
  def index
  require 'net/http'
json = DATA_PROVIDER.getEvents(params[:id],@city,Date.today.to_s,Date.today.to_s,"ASC")
if(json["status"].to_i == 200)
	@result = json
else
	redirect_to "/"
end
end
def eventinfo
json = DATA_PROVIDER.getEventInfo(params[:id],@city)
if(json["status"].to_i == 200)
	@result = json
else
	redirect_to "/events/index/" + @types["id"]
end
end
end

