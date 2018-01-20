require 'pry'
class ForvosController < ApplicationController
  def forvo
    hex_array = params[:translated].each_byte.map { |b| b.to_s(16) } # .unpack('H*')[0] => "hex"
    encoded_ko = hex_array.map { |el| '%' + el }.join
    # binding.pry

    url = "https://apifree.forvo.com/action/word-pronunciations/format/json/word/" + encoded_ko + "/key/#{ENV["FORVO_KEY"]}"

    response = HTTParty.get(url)
    payload = response['items']

    render(
      json: payload,
      status: :ok
    )

    # if payload == 0
    #   render json: payload, status: :ok, location: @user
    # else
    #   return response['items']
    # end
  end

  private

  def forvo_params
    # binding.pry
    params.require(:forvo).permit(:translated)
  end
end
