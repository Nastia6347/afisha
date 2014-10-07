class FourGeoDataProvider
 def getEventFilms(city,dateStart,dateEnd,sorting)
  return getEvents(-1001,city,dateStart,dateEnd,sorting)
 end
 def getEventTypes
 url= URI.parse("http://api.4geo.ru/rest2/affiche/eventTypes.json?branchId=" + @city.to_s)
 req = Net::HTTP::Get.new(url.to_s)
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.request(req)
	}
	return JSON.parse(res.body.force_encoding('UTF-8'))
 end
 def getEvents(type,city,dateStart,dateEnd,sorting)
 url= URI.parse("http://api.4geo.ru/rest2/affiche/events.json?content_type=" + type.to_s + "&town_id=" + city.to_s + "&dateStart=" +  dateStart + "&dateEnd=" + dateEnd + "&sorting=" + sorting)
 req = Net::HTTP::Get.new(url.to_s)
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.request(req)
	}
	return JSON.parse(res.body.force_encoding('UTF-8'))
 end
end