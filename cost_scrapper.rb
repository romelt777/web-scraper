require 'nokogiri'
require 'httparty'


url = "https://www.kbb.com/new-cars/total-cost-of-ownership/"

# url = "https://www.kbb.com/toyota/4runner/2019/sr5/?vehicleid=439013&intent=buy-new"


# https://www.kbb.com/toyota/corolla/2019/l/?vehicleid=436531&intent=buy-new

# cost info location: https://www.kbb.com/vehicles/hub/_costtoown/?vehicleid=439013
# vehicleid=441277

doc = Nokogiri::HTML(HTTParty.get(url))
puts doc

