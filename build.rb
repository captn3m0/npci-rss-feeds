require 'weneedfeed'
require 'faraday/curb'

contents = File.read('weneedfeed.yml.tpl')
c = contents.gsub('__YEAR__', Time.now.strftime('%Y'))
File.write('weneedfeed.yml', c)

Weneedfeed::Scraping.faraday_connection.adapter :curb

Weneedfeed::Capture.call(
	base_url: "https://captnemo.in/npci-rss-feeds",
	schema_path: 'weneedfeed.yml'
)