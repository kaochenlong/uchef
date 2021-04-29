require 'nokogiri'
require 'open-uri'
require 'json'

def update_restaurants
  data = Nokogiri::HTML(URI.open('https://guide.michelin.com/tw/zh_TW/taipei-region/taipei/restaurants/1-star-michelin'))

  restaurants = data.css('.card__menu-content--title a').map do |d|
    {
      name: d.content.strip,
      link: "https://guide.michelin.com#{d['href']}"
    }
  end

  r = File.new(Rails.root.join('public', 'result.json'), 'w')
  r.write(restaurants.to_json)
  r.close
end

namespace :restaurants do
  desc '更新'
  task :update => :environment do
    update_restaurants
  end
end