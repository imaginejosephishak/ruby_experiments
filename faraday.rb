#!/usr/bin/ruby

require 'faraday'
require 'nokogiri'


url="https://www.zillow.com"
apipath="webservice"
api="GetRegionChildren.htm"
credential="<somecredential>"
state="ca"
city="lakeforest"
childtype="neighborhood"
con = Faraday.new :url => "#{url}/#{apipath}/#{api}?zws-id=#{credential}&state=#{state}&city=#{city}&childtype=#{childtype}"

res = con.get
doc = Nokogiri::XML(res.body)

message = doc.at_xpath('//message/text').content
puts "message="+message

code = doc.at_xpath('//message/code').content
puts "code="+code

url = doc.at_xpath('//response/list/region/url').content
puts "url="+url
