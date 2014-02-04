require 'unirest'

def analyse url
	token = "55b926c2d517a686c705a3846534f87a"
	type = "article"
	response = Unirest::get "http://api.diffbot.com/v2/#{type}", 
						parameters: { token: token, url: url }
	{text: response.body["text"], 
	 image: response.body["images"] ? response.body["images"][0]["url"] : nil}
end

url = ARGV[0]
p analyse url