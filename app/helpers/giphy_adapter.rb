module GiphyAdapter

  def self.search(search_string)
    require 'uri'
    require 'net/http'

    url = URI("http://api.giphy.com/v1/gifs/search?&rating=pg&q=#{search_string}+motivation&api_key=66488fa7813a472d8f999db142dd4ece&limit=15")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'ddadb8a8-50a5-5bcd-8447-943525d278ba'

    response = JSON.parse(http.request(request).body)
    return response
    # response["data"].map { |result| result["images"]["fixed_height"]["url"] }
  end