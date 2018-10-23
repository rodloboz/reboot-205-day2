require 'open-uri'
require 'nokogiri'
require 'byebug'

def fetch_from_etsy(term)
  query = term.gsub(" ", "+")

  # 1. We get the HTML page content thanks to open-uri
  html_content = open("https://www.etsy.com/search?q=#{query}").read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(html_content)

  # 3. We search for the correct elements containing the items' title in our HTML doc
  articles = []
  doc.search('.block-grid-xs-2 .v2-listing-card__info .text-body').each do |element|
    # 4. For each item found, we extract its title and print it
    articles << element.text.strip.split(" |").first
  end

  articles.uniq.take(6)
end
