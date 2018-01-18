require_dependency '../../lib/api_wrapper'

class GooglesController < ApplicationController

  def create
    # @flashcard = ApiWrapper.google_translate(params[:search])

    if params[:search]
      @googles = ApiWrapper.google_translate(params[:search])

      render json: @googles, status: :ok, location: @googles
    else
      # flash[:status] = :failure
      # flash[:message] = "Invalid search term, please search for something else"
      render json: @googles.errors, status: :unprocessable_entity
    end
  end
end
