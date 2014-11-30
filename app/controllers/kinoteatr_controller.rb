class KinoteatrController < ApplicationController
  def index
    require 'net/http'
    json = DATA_PROVIDER.getKinoInfo(params[:id])
    if(json["status"].to_i == 200)
      @result = json
    else
      redirect_to :back
    end
    json = DATA_PROVIDER.getGeoLokation(@result["result"]["places"][0]["geoobjectId"])
    if(json["status"].to_i == 200)
      @resu = json
    else
      redirect_to :back
    end
  end
end
