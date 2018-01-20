require 'base64'
require 'HTTParty'

class ApiWrapper
  BASE_URL = "https://translation.googleapis.com/language/translate/v2/"
  GOOGLE_ID = ENV["GOOGLE_ID"]


  def self.google_translate(search)
    url = BASE_URL + "?key=#{GOOGLE_ID}" + "&q=#{search}" + "source=en&target=ko&format=text"

    response = HTTParty.post(url)

    # need array to store the parsed api hash results
    translations_list = []

    if response["data"]["translations"] == 0
      return []
    else
      return response["data"]["translations"][0]["translatedText"]
    end
  end

  def self.forvo(search)
    hex_array = search.each_byte.map { |b| b.to_s(16) } # .unpack('H*')[0] => "hex"
    encoded_ko = hex_array.map { |el| '%' + el }.join

    url = "https://apifree.forvo.com/action/word-pronunciations/format/json/word/" + encoded_ko + "/key/#{ENV["FORVO_KEY"]}"

    response = HTTParty.get(url)

    audio_files = []

    if response['items'] == 0
      return []
    else
      return response['items']
    end
  end


  private



end
