require 'faraday'
require 'nokogiri'


url="https://www.zillow.com"
apipath="webservice"
credential="<zws-id>"

RSpec.describe "Zillow" do
   context "with Lake Forest, CA" do
      api="GetRegionChildren.htm"
      state="ca"
      city="lakeforest"
      childtype="neighborhood"

      lakeforesturl="http://www.zillow.com/local-info/CA-Lake-Forest/Portola-Hills/r_13375/"
      successfulmsg="Request successfully processed"
      successfulcode=0
      con = Faraday.new :url => "#{url}/#{apipath}/#{api}?zws-id=#{credential}&state=#{state}&city=#{city}&childtype=#{childtype}"

      res = con.get
      doc = Nokogiri::XML(res.body)

      it "returns the Request successfully processed message" do
        message = doc.at_xpath('//message/text').content
        #puts "message="+message
        expect(message).to eq "#{successfulmsg}"
      end

      it "returns the results of the GetRegionChildren API Call" do
         code = doc.at_xpath('//message/code').content
         #puts "code="+code
         expect(code.to_s).to eq "#{successfulcode}"
      end

      it "returns the correct url for city of Lake Forest " do
         url = doc.at_xpath('//response/list/region/url').content
         #puts "url="+url
         expect(url).to eq "#{lakeforesturl}"

      end
   end
   context "with 26111 Hillsford Place, Lake Forest, CA 92630" do
      api="GetDeepSearchResults.htm"
      address="26111%20Hillsford%20Place"
      citystatezip="Lake%20Forest%2C%20CA%2092630"

      streetresult="26111 Hillsford Pl"
      successfulmsg="Request successfully processed"
      successfulcode=0
      con = Faraday.new :url => "#{url}/#{apipath}/#{api}?zws-id=#{credential}&address=#{address}&citystatezip=#{citystatezip}"

      res = con.get
      doc = Nokogiri::XML(res.body)

      it "returns the Request successfully processed message" do
        message = doc.at_xpath('//message/text').content
        #puts "message="+message
        expect(message).to eq "#{successfulmsg}"
      end

      it "returns the results of the GetRegionChildren API Call" do
         code = doc.at_xpath('//message/code').content
         #puts "code="+code
         expect(code.to_s).to eq "#{successfulcode}"
      end

      it "returns the correct url for city of Lake Forest " do
         street = doc.at_xpath('//response/results/result/address/street').content
         #puts "url="+url
         expect(street).to eq "#{streetresult}"

      end
   end
end
