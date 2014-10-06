require 'rubygems'  
require 'nokogiri'  
require 'open-uri'
require 'uri'

root = "http://www.inmuebles.lagaceta.com.ar"  
doc = Nokogiri::HTML open "#{root}/avisos"
 
doc.css(".advice-link").each do |item|
	apt = Nokogiri::HTML open URI.escape("#{root}#{item['href']}")
  	title = apt.at_css("h3").text  
  	price = apt.at_css(".blue").text
  	rooms = apt.at_css(".label").text
  	n = apt.at_css(".content").text
  	puts "#{title} - #{price} - #{rooms} #{n}" 
end
