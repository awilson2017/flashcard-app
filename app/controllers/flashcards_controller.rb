class FlashcardsController < ApplicationController
  # TODO: remember to delete as soon as you know it's not needed.
  # before_action :set_flashcard, only: [:show, :update, :destroy]
  before_action :set_flashcard, only: [:show, :tags, :update, :destroy]


  # GET /flashcards
  def index
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      @flashcards = user.flashcards

      render json: @flashcards
    end

  end

  # GET /flashcards/1/tags
  def tags
    @flashcards.tags
  end

  # GET /flashcards/1
  def show
    render json: @flashcard
  end

  # POST /flashcards
  def create
    @flashcard = Flashcard.new(flashcard_params)
    # @flashcard.save

    if @flashcard.save
      render json: @flashcard, status: :created, location: @flashcard
    else
      render json: @flashcard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flashcards/1
  def update
    if @flashcard.update(flashcard_params)
      render json: @flashcard
    else
      render json: @flashcard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flashcards/1
  def destroy
    @flashcard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flashcard
      @flashcard = Flashcard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flashcard_params
      params.permit(:user_id, :question, :answer)

      # TODO: delete when unnecessary
      # params.require(:flashcard).permit(:user_id, :question, :answer, :image)
    end
end
