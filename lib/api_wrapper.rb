require 'base64'
require 'HTTParty'

class ApiWrapper
  BASE_URL = "https://translation.googleapis.com/language/translate/v2/"
  API_ID = ENV["APPLICATION_ID"]


  def self.google_translate(search)
    url = BASE_URL + "?key=#{API_KEY}" + "&q=#{search}" + "source=en&target=ko&format=text"

    response = HTTParty.post(url)

    # need array to store the parsed api hash results
    translations_list = []

    if response["data"]["translations"] == 0
      return []
    else
      return response["data"]["translations"][0]["translatedText"]
    end
  end


  private



end
