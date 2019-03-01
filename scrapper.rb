require 'nokogiri'
require 'httparty'

# Fetch and parse HTML document
home = "https://www.auto123.com/en/new-cars/"

# used-cars > scrap out all info available

makes = []
models = []
url = "#{home}search/"


# pick up all makes
doc = Nokogiri::HTML(HTTParty.get(home))
doc.css('label.label, select option').each do |make|
  if make.content != "Make" && make.content != "Choose" && make.content != "Model" && make.content != "Any model"
    makes.push(make.content)
  end
end

puts makes

# pick up all models from a single make
puts "**********SCRAPPING CAR MODEL************"

#change url to scrap per different model
url = url + makes[1].downcase

doc = Nokogiri::HTML(HTTParty.get(url))
doc.css('label.label, option').each do |model|
  if model.content != "Choose a model"
    puts model.content
  end
end

# pick up all years available
